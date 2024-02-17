function get_timesteps(datafile)
    timesteps = Timestep[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Timesteps.csv"), DataFrame, delim=','))
        s = Timestep(r[:Timestep], r[:Days], r[:Type])
        push!(timesteps, s)
    end
    return timesteps
end

function get_timestep_mapping(timesteps)
    next_step = Dict(
        zip(
            vcat(timesteps, get_name.(timesteps)),
            vcat(
                timesteps[2:end],
                timesteps[1],
                get_name.(timesteps[2:end]),
                get_name(timesteps[1]),
            ),
        ),
    )
    previous_step = Dict(
        zip(
            vcat(timesteps, get_name.(timesteps)),
            vcat(
                timesteps[end],
                timesteps[1:end-1],
                get_name(timesteps[end]),
                get_name.(timesteps[1:end-1]),
            ),
        ),
    )
    return TimestepMapping(next_step, previous_step)
end

function get_years(datafile)
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Years.csv"), DataFrame, delim=','))
        years = Years(
            r[:Initial]:r[:Step]:r[:Last],
            r[:Initial],
            r[:Step],
            r[:Last],
            sum(s.days for s in get_timesteps(datafile)),
            "$(r[:Initial]) - $(r[:Last])",
        )
        r = CSV.read(joinpath(datafile, "general_data", "Temporal_Preferences.csv"), DataFrame)[1,"Discount Rate"]
        discount = JuMP.Containers.DenseAxisArray(
            [1.0 / (1.0 + r)^(y - years.start) for y in years.range],
            years.range,
        )

        return discount, years
    end
end

function get_nodes(datafile)
    nodes = Node[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Nodes.csv"),DataFrame, delim=','))
        n = Node(
            name = r[:Node],
            producer = "P_$(r[:Node])",
            storage = "S_$(r[:Node])",
            converter = "V_$(r[:Node])",
            domestic_trader = r[Symbol("Nodal Trader")],
            region = r[:Region],
            cost_factor = r[Symbol("Cost Factor")],
        )
        push!(nodes, n)
    end
    return nodes
end

function get_producers(datafile)
    producers = Producer[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Nodes.csv"),DataFrame, delim=','))
        p = Producer(
            name = "P_$(r[:Node])",
            node = r[:Node],
            trader = r[Symbol("Nodal Trader")],
            cost_factor = r[Symbol("Cost Factor")],
        )
        push!(producers, p)
    end
    return producers
end

function get_input_data(
    datafile,
    producers::Vector{Producer},
    inputs::Vector{Input},
    input_operational_blocks::Vector{InputOperationalBlock},
    timesteps::Vector{Timestep},
    years::Years,
)
    av_I = JuMP.Containers.DenseAxisArray(
        zeros(
            length(producers),
            length(inputs),
            length(input_operational_blocks),
            length(timesteps),
        ),
        get_name.(producers),
        get_name.(inputs),
        get_name.(input_operational_blocks),
        get_name.(timesteps),
    )

    av_I_df = CSV.read(
        joinpath(datafile, "inputs", "Availability_Factors.csv"), DataFrame, delim=','
    )

    L_I = JuMP.Containers.DenseAxisArray(zeros(length(inputs)), get_name.(inputs))

    Λ_I_df = CSV.read(
        joinpath(datafile, "inputs", "Exogenous_Capacities.csv"), DataFrame, delim=','
    )

    Ω_I_df = CSV.read(
        joinpath(datafile, "inputs", "Capacity_Expansion_Limits.csv"), DataFrame, delim=','
    )

    op_cost_par_df = CSV.read(
        joinpath(datafile, "inputs", "Cost_Parameters.csv"), DataFrame, delim=','
    )

    inv_cost_par_df = CSV.read(
        joinpath(datafile, "inputs", "Investment_Cost_Parameters.csv"), DataFrame, delim=','
    )

    life_df = CSV.read(
        joinpath(datafile, "inputs", "Lifetimes.csv"), DataFrame, delim=','
    )
    
    for i in get_name.(inputs)
        L_I_h = life_df[(life_df.Input.==i), "Lifetime"]
        if length(L_I_h) == 1
            L_I[i] = L_I_h[1]
        else
            @_warning "Found $(length(L_I_h)) values for input Lifetime L_I" Input = i
        end
    end

    c_Δ_I = JuMP.Containers.DenseAxisArray(
        zeros(
            length(producers),
            length(inputs),
            length(input_operational_blocks),
            length(years.range),
        ),
        get_name.(producers),
        get_name.(inputs),
        get_name.(input_operational_blocks),
        years.range,
    )

    Ω_I = JuMP.Containers.DenseAxisArray(
        zeros(
            length(producers),
            length(inputs),
            length(input_operational_blocks),
            length(years.range),
        ),
        get_name.(producers),
        get_name.(inputs),
        get_name.(input_operational_blocks),
        years.range,
    )

    c_Pl = JuMP.Containers.DenseAxisArray(
        zeros(
            length(producers),
            length(inputs),
            length(input_operational_blocks),
            length(timesteps),
            length(years.range),
        ),
        get_name.(producers),
        get_name.(inputs),
        get_name.(input_operational_blocks),
        get_name.(timesteps),
        years.range,
    )

    c_Pq = JuMP.Containers.DenseAxisArray(
        zeros(
            length(producers),
            length(inputs),
            length(input_operational_blocks),
            length(timesteps),
            length(years.range),
        ),
        get_name.(producers),
        get_name.(inputs),
        get_name.(input_operational_blocks),
        get_name.(timesteps),
        years.range,
    )

    Λ_I = JuMP.Containers.DenseAxisArray(
        zeros(
            length(producers),
            length(inputs),
            length(input_operational_blocks),
            length(years.range),
        ),
        get_name.(producers),
        get_name.(inputs),
        get_name.(input_operational_blocks),
        years.range,
    )

    for p in producers, i in get_name.(inputs)
        p_name = get_name(p)
        n = get_node(p)

        for y in years.range

            for s in get_name.(timesteps)

                for b in get_name.(input_operational_blocks)

                    Λ_I_h = Λ_I_df[
                        (Λ_I_df.Input.==i).&(Λ_I_df.Node.==n),
                        "Capacity $b $y",
                    ]

                    if length(Λ_I_h) == 1
                        Λ_I[p_name, i, b, y] = Λ_I_h[1]
                    else
                        @_warning "Found $(length(Λ_I_h)) values for production Λ_I" Producer =
                            p_name Input = i Block = b Year = y
                    end

                    c_Pl_h = op_cost_par_df[
                        (op_cost_par_df.Input.==i).&(op_cost_par_df.Node.==n).&(op_cost_par_df[
                            !,
                            "Timestep",
                        ].==s),
                        "Linear Cost $b $y",
                    ]

                    if length(c_Pl_h) == 1
                        c_Pl[p_name, i, b, s, y] = c_Pl_h[1]
                    else
                        @_warning "Found $(length(c_Pl_h)) values for input cost parameter c_Pl" Producer =
                            p_name Input = i Block = b Timestep = s Year = y
                    end

                    c_Pq_h = op_cost_par_df[
                        (op_cost_par_df.Input.==i).&(op_cost_par_df.Node.==n).&(op_cost_par_df[
                            !,
                            "Timestep",
                        ].==s),
                        "Quadratic Cost $b $y",
                    ]

                    if length(c_Pq_h) == 1
                        c_Pq[p_name, i, b, s, y] = c_Pq_h[1]
                    else
                        @_warning "Found $(length(c_Pq_h)) values for input marginal cost parameter c_Pq" Producer =
                            p_name Input = i Block = b Timestep = s Year = y
                    end

                end

            end

            for b in get_name.(input_operational_blocks)

                Ω_I_h = Ω_I_df[
                    (Ω_I_df.Input.==i).&(Ω_I_df.Node.==n),
                    "Capacity Expansion Limit $b $y",
                ]

                if length(Ω_I_h) == 1
                    Ω_I[p_name, i, b, y] = Ω_I_h[1]
                else
                    @_warning "Found $(length(Ω_I_h)) values for input expansion limits" Producer =
                        p_name Input = i Block = b Year = y
                end

                c_Δ_I_h = inv_cost_par_df[
                    (inv_cost_par_df.Input.==i).&(inv_cost_par_df.Node.==n),
                    "Initial Investment Cost $b $y",
                ]

                if length(c_Δ_I_h) == 1
                    c_Δ_I[p_name, i, b, y] = c_Δ_I_h[1]
                else
                    @_warning "Found $(length(c_Δ_I_h)) values for input expansion cost parameters" Producer =
                        p_name Input = i Block = b Year = y
                end

                for s in get_name.(timesteps)
                    av_I_h = av_I_df[
                        (av_I_df.Input.==i).&(av_I_df.Node.==n).&(av_I_df.Timestep.==s),
                        "Availability Factor $b",
                    ]

                    if length(av_I_h) == 1
                        av_I[p_name, i, b, s] = av_I_h[1]
                    else
                        @_warning "Found $(length(av_I_h)) values for availability factor" Producer =
                            p_name Input = i Block = b Timestep = s
                    end
                end

            end

        end

    end

    input_data = InputData(
        av_I = av_I,
        c_Pl = c_Pl,
        c_Pq = c_Pq,
        Λ_I = Λ_I,
        Ω_I = Ω_I,
        c_Δ_I = c_Δ_I,
        L_I = L_I,
    )

    return input_data
end

function get_production_data(
    datafile,
    inputs::Vector{Input},
    producers::Vector{Producer},
    commodities::Vector{Commodity},
    origins::Vector{Origin},
    years::Years,
)
    tec_df = CSV.read(
        joinpath(datafile, "production", "Technology.csv"), DataFrame, delim=','
    )

    cap_df = CSV.read(
        joinpath(datafile, "production", "Exogenous_Capacities.csv"), DataFrame, delim=','
    )
    
    lim_df = CSV.read(
        joinpath(datafile, "production", "Capacity_Expansion_Limits.csv"), DataFrame, delim=','
    )

    for i in get_name.(inputs)
        if !("Factor Intensity $i" in names(tec_df))
            @_error "Missing Input $i in Production Technology"
        end
    end

    Λ_P = JuMP.Containers.DenseAxisArray(
        zeros(length(producers), length(commodities), length(origins), length(years.range)),
        get_name.(producers),
        get_name.(commodities),
        get_name.(origins),
        years.range,
    )
    c_P = JuMP.Containers.DenseAxisArray(
        zeros(length(producers), length(commodities), length(origins), length(years.range)),
        get_name.(producers),
        get_name.(commodities),
        get_name.(origins),
        years.range,
    )
    Ω_P = JuMP.Containers.DenseAxisArray(
        zeros(length(producers), length(commodities), length(origins), length(years.range)),
        get_name.(producers),
        get_name.(commodities),
        get_name.(origins),
        years.range,
    )
    c_Δ_P = JuMP.Containers.DenseAxisArray(
        zeros(length(producers), length(commodities), length(origins), length(years.range)),
        get_name.(producers),
        get_name.(commodities),
        get_name.(origins),
        years.range,
    )
    L_P = JuMP.Containers.DenseAxisArray(
        zeros(length(commodities), length(origins)),
        get_name.(commodities),
        get_name.(origins),
    )
    fi_P = JuMP.Containers.DenseAxisArray(
        zeros(length(commodities), length(inputs), length(origins)),
        get_name.(commodities),
        get_name.(inputs),
        get_name.(origins),
    )

    for c in get_name.(commodities), o in get_name.(origins)

        L_P_h = tec_df[(tec_df.Output.==c).&(tec_df.Origin.==o), "Lifetime"]
        if length(L_P_h) == 1
            L_P[c, o] = L_P_h[1]
        else
            @_warning "Found $(length(L_P_h)) values for production L_P" Commodity = c Origin =
                o
        end

        for i in get_name.(inputs)
            fi_P_h = tec_df[(tec_df.Output.==c).&(tec_df.Origin.==o), "Factor Intensity $i"]
            if length(fi_P_h) == 1
                fi_P[c, i, o] = fi_P_h[1]
            else
                @_warning "Found $(length(fi_P_h)) values for production fi_P" Commodity = c Input =
                    i Output = o
            end
        end

        for p in producers, y in years.range
            n = get_node(p)
            p_name = get_name(p)
            Λ_P_h = cap_df[
                (cap_df.Output.==c).&(cap_df.Node.==n).&(cap_df.Origin.==o),
                "Capacity $y",
            ]
            if length(Λ_P_h) == 1
                Λ_P[p_name, c, o, y] = Λ_P_h[1]
            else
                @_warning "Found $(length(Λ_P_h)) values for production Λ_P" Producer =
                    p_name Commodity = c Origin = o Year = y
            end

            c_P_h =
                p.cost_factor *
                tec_df[(tec_df.Output.==c).&(tec_df.Origin.==o), "Operational Cost $y"]
            if length(c_P_h) == 1
                c_P[p_name, c, o, y] = c_P_h[1]
            else
                @_warning "Found $(length(c_P_h)) values for production c_P" Producer =
                    p_name Commodity = c Origin = o Year = y
            end

            Ω_P_h = lim_df[
                (lim_df.Output.==c).&(lim_df.Node.==n).&(lim_df.Origin.==o),
                "Expansion Limit Capacity $y",
            ]
            if length(Ω_P_h) == 1
                Ω_P[p_name, c, o, y] = Ω_P_h[1]
            else
                @_warning "Found $(length(Ω_P_h)) values for production Ω_P" Producer =
                    p_name Commodity = c Origin = o Year = y
            end

            c_Δ_P_h =
                p.cost_factor *
                tec_df[(tec_df.Output.==c).&(tec_df.Origin.==o), "Investment Cost $y"]
            if length(c_Δ_P_h) == 1
                c_Δ_P[p_name, c, o, y] = c_Δ_P_h[1]
            else
                @_warning "Found $(length(c_Δ_P_h)) values for production c_Δ_P" Producer =
                    p_name Commodity = c Origin = o Year = y
            end
        end
    end

    production_data = ProductionData(
        Λ_P = Λ_P,
        c_P = c_P,
        Ω_P = Ω_P,
        c_Δ_P = c_Δ_P,
        L_P = L_P,
        fi_P = fi_P,
    )

    return production_data
end

function get_trade_data(
    datafile,
    traders::Vector{Trader},
    nodes::Vector{Node},
    commodities::Vector{Commodity},
    origins::Vector{Origin},
    years::Years,
)
    sanctions_df = CSV.read(
        joinpath(datafile, "trade", "Sanctions.csv"), DataFrame, delim=','
    )

    interim_sanctions = Dict{Tuple{String,String,String,String,Int64},Float64}(
        (row.Trader, row.Node, row.Commodity, row.Origin, y) =>
            sanctions_df[idx, "Yearly Limit $y"] for
        (idx, row) in enumerate(eachrow(sanctions_df)), y in years.range if
        row.Trader in get_name.(traders) &&
        row.Node in get_name.(nodes) &&
        row.Commodity in get_name.(commodities) &&
        row.Origin in get_name.(origins) &&
        y in years.range
    )

    Λ_T = JuMP.Containers.SparseAxisArray(interim_sanctions)

    NC_df = CSV.read(
        joinpath(datafile, "general_data", "Market_Power.csv"), DataFrame
    )
    
    NC = JuMP.Containers.DenseAxisArray(
        zeros(length(traders), length(nodes), length(commodities)),
        get_name.(traders),
        get_name.(nodes),
        get_name.(commodities),
    )
    for d in get_name.(commodities)
        domestic_nc = NC_df[(NC_df.Commodity.==d), "Domestic"]
        foreign_nc = NC_df[(NC_df.Commodity.==d), "Foreign"]
        if length(domestic_nc) == 1
            for t in traders, n in nodes
                if n.domestic_trader == get_name(t)
                    NC[get_name(t), get_name(n), d] = domestic_nc[1]
                else
                    NC[get_name(t), get_name(n), d] = foreign_nc[1]
                end
            end
        else
            @_warning "Found $(length(domestic_nc)) values for market power exertion of commodity, set to 0 instead" Commdodity =
                d
        end
    end

    specific_df = CSV.read(
        joinpath(datafile, "trade", "Specific_Market_Power.csv"), DataFrame, delim=','
    )

    specific_dict = Dict{Tuple{String,String,String},Float64}(
        (row.Trader, row.Node, row.Commodity) =>
            specific_df[idx, "Specific Market Power"] for
        (idx, row) in enumerate(eachrow(specific_df))
    )

    for (t, n, c) in keys(specific_dict)
        if t in get_name.(traders) && n in get_name.(nodes) && c in get_name.(commodities)
            NC[t, n, c] = specific_dict[t, n, c]
        end
    end

    trade_data = TradeData(Λ_T = Λ_T, NC = NC)

    return trade_data
end

function get_conversion_data(
    datafile,
    conversion_technologies::Vector{ConversionTechnology},
    converters::Vector{Converter},
    input_commodities::Vector{Commodity},
    output_commodities::Vector{Commodity},
    repurposing_conversion_technologies::Vector{RepurposingConversion},
    years::Years,
)
    df = CSV.read(
        joinpath(datafile, "conversion", "Conversion_Data.csv"), DataFrame, delim=','
    )
    
    cap_df = CSV.read(
        joinpath(datafile, "conversion", "Capacities.csv"), DataFrame, delim=','
    )

    repurposing_df = CSV.read(
        joinpath(datafile, "conversion", "Repurposing.csv"), DataFrame, delim=','
    )
    
    for f in get_name.(input_commodities)
        if f ∉ df[!, "Input Commodity"]
            @_warning "Missing input commodity in converison technologies" Commodity = f
        end
    end
    for d in get_name.(output_commodities)
        if d ∉ df[!, "Output Commodity"]
            @_warning "Missing output commodity in converison technologies" Commodity = d
        end
    end

    Λ_V = JuMP.Containers.DenseAxisArray(
        zeros(
            length(converters),
            length(input_commodities),
            length(output_commodities),
            length(years.range),
        ),
        get_name.(converters),
        get_name.(input_commodities),
        get_name.(output_commodities),
        years.range,
    )
    c_V = JuMP.Containers.DenseAxisArray(
        zeros(
            length(converters),
            length(input_commodities),
            length(output_commodities),
            length(years.range),
        ),
        get_name.(converters),
        get_name.(input_commodities),
        get_name.(output_commodities),
        years.range,
    )
    c_Δ_V = JuMP.Containers.DenseAxisArray(
        zeros(
            length(converters),
            length(input_commodities),
            length(output_commodities),
            length(years.range),
        ),
        get_name.(converters),
        get_name.(input_commodities),
        get_name.(output_commodities),
        years.range,
    )

    c_Δ_RV = JuMP.Containers.DenseAxisArray(
        zeros(
            length(converters),
            length(input_commodities),
            length(output_commodities),
            length(input_commodities),
            length(output_commodities),
            length(years.range),
        ),
        get_name.(converters),
        get_name.(input_commodities),
        get_name.(output_commodities),
        get_name.(input_commodities),
        get_name.(output_commodities),
        years.range,
    )

    f_RV = JuMP.Containers.DenseAxisArray(
        zeros(
            length(input_commodities),
            length(output_commodities),
            length(input_commodities),
            length(output_commodities),
        ),
        get_name.(input_commodities),
        get_name.(output_commodities),
        get_name.(input_commodities),
        get_name.(output_commodities),
    )

    L_V = JuMP.Containers.DenseAxisArray(
        zeros(length(input_commodities), length(output_commodities)),
        get_name.(input_commodities),
        get_name.(output_commodities),
    )

    fi_V = JuMP.Containers.DenseAxisArray(
        zeros(length(input_commodities), length(output_commodities)),
        get_name.(input_commodities),
        get_name.(output_commodities),
    )

    for (f, d) in getfield.(conversion_technologies, :CV)
        filter_idxs = (df[!, "Input Commodity"] .== f) .& (df[!, "Output Commodity"] .== d)
        fi_V_h = df[filter_idxs, "Factor Intensity"]
        if length(fi_V_h) == 1
            fi_V[f, d] = fi_V_h[1]
            L_V[f, d] = df[filter_idxs, "Lifetime"][1]
        else
            @_warning "Found $(length(fi_V_h)) values for conversion technology" Input = f Output =
                d
        end
        for v in converters, y in years.range
            Λ_V_h = cap_df[
                (cap_df[
                    !,
                    "Node",
                ].==get_node(
                    v,
                )).&(cap_df[
                    !,
                    "Input Commodity",
                ].==f).&(cap_df[!, "Output Commodity"].==d),
                "Capacity $y",
            ]
            if length(Λ_V_h) == 1
                Λ_V[get_name(v), f, d, y] = Λ_V_h[1]
            else
                @_warning "Found $(length(Λ_V_h)) values for conversion capacity" Converter =
                    get_name(v) Input = f Output = d Year = y
            end
            c_V[get_name(v), f, d, y] =
                v.cost_factor * df[filter_idxs, "Operational Costs $y"][1]
            c_Δ_V[get_name(v), f, d, y] =
                v.cost_factor * df[filter_idxs, "Investment Costs $y"][1]
        end
    end

    for ((c_in_old, c_out_old), (c_in_new, c_out_new)) in
        getfield.(repurposing_conversion_technologies, :RV)
        filter_idxs =
            (repurposing_df[!, "From Input Commodity"] .== c_in_old) .&
            (repurposing_df[!, "From Output Commodity"] .== c_out_old) .&
            (repurposing_df[!, "To Input Commodity"] .== c_in_new) .&
            (repurposing_df[!, "To Output Commodity"] .== c_out_new)

        f_RV[c_in_old, c_out_old, c_in_new, c_out_new] = repurposing_df[filter_idxs, "Repurposing Factor"][1]

        for v in converters, y in years.range
            c_Δ_RV[get_name(v), c_in_old, c_out_old, c_in_new, c_out_new, y] =
                v.cost_factor * repurposing_df[filter_idxs, "Unit Repurposing Cost $y"][1]
        end
    end

    conversion_data = ConversionData(
        Λ_V = Λ_V,
        c_V = c_V,
        c_Δ_V = c_Δ_V,
        c_Δ_RV = c_Δ_RV,
        L_V = L_V,
        fi_V = fi_V,
        f_RV = f_RV,
    )

    return conversion_data
end

function get_arc_data(
    datafile,
    arcs::Vector{TransportArc},
    commodities::Vector{Commodity},
    arc_repurposing_technologies::Vector{RepurposingArcs},
    years::Years,
)
    commodity_df = CSV.read(
        joinpath(datafile, "transport", "Commodity_Data.csv"), DataFrame, delim=','
    )
    
    pipe_dist_df = CSV.read(
        joinpath(datafile, "transport", "Pipeline_Distances.csv"), DataFrame, delim=','
    )
    
    ship_dist_df = CSV.read(
        joinpath(datafile, "transport", "Shipping_Distances.csv"), DataFrame, delim=','
    )
    
    exist_pipes = CSV.read(
        joinpath(datafile, "transport", "Exogenous_Pipelines.csv"), DataFrame, delim=','
    )
    
    repurposing_df = CSV.read(
        joinpath(datafile, "transport", "Repurposing_Data.csv"), DataFrame, delim=','
    )

    c_A = JuMP.Containers.DenseAxisArray(
        zeros(length(arcs), length(commodities), length(years.range)),
        get_name.(arcs),
        get_name.(commodities),
        years.range,
    )

    c_Δ_A = JuMP.Containers.DenseAxisArray(
        zeros(length(arcs), length(commodities), length(years.range)),
        get_name.(arcs),
        get_name.(commodities),
        years.range,
    )

    c_Δ_RA = JuMP.Containers.DenseAxisArray(
        zeros(length(arcs), length(commodities), length(commodities), length(years.range)),
        get_name.(arcs),
        get_name.(commodities),
        get_name.(commodities),
        years.range,
    )

    f_RA = JuMP.Containers.DenseAxisArray(
        zeros(length(commodities), length(commodities)),
        get_name.(commodities),
        get_name.(commodities),
    )

    Λ_A = JuMP.Containers.DenseAxisArray(
        zeros(length(arcs), length(commodities), length(years.range)),
        get_name.(arcs),
        get_name.(commodities),
        years.range,
    )

    l_a = JuMP.Containers.DenseAxisArray(
        zeros(length(arcs), length(commodities)),
        get_name.(arcs),
        get_name.(commodities),
    )

    L_A = JuMP.Containers.DenseAxisArray(zeros(length(commodities)), get_name.(commodities))

    for f in commodities
        flow_commodity_idx = commodity_df[!, "Flow Commodity"] .== get_name(f)
        transport_type = commodity_df[flow_commodity_idx, "Transport Type"]
        if length(transport_type) == 1
            f.transport = transport_type[1]
        elseif length(transport_type) == 0
            @_error "Found $(length(transport_type)) values for flow commodity transport type" Commodity =
            get_name(f)
        elseif length(transport_type) !== 1
            f.transport = transport_type[1]
            @_warning "Found $(length(transport_type)) values for flow commodity transport type, using first type" Commodity =
            get_name(f)
        end
        L_A[get_name(f)] = commodity_df[flow_commodity_idx, "Lifetime"][1]
        for a in arcs
            if transport_type[1] == "Pipeline"
                distance =
                    pipe_dist_df[(pipe_dist_df[!, "Start"].==a.start_node), a.end_node][1]
                l_a[get_name(a), get_name(f)] =
                    distance * commodity_df[flow_commodity_idx, "Loss per kkm"][1]
                for y in years.range
                    c_A[get_name(a), get_name(f), y] =
                        a.cost_factor *
                        distance *
                        commodity_df[flow_commodity_idx, "Operational Cost per kkm $y"][1]
                    c_Δ_A[get_name(a), get_name(f), y] =
                        a.cost_factor *
                        distance *
                        commodity_df[flow_commodity_idx, "Investment Cost per kkm $y"][1]
                    pipe_cap_arr = exist_pipes[
                        (exist_pipes[
                            !,
                            "Start",
                        ].==a.start_node).&(exist_pipes[
                            !,
                            "End",
                        ].==a.end_node).&(exist_pipes[!, "Flow Commodity"].==get_name(f)),
                        "Capacity $y",
                    ]
                    if length(pipe_cap_arr) == 1
                        Λ_A[get_name(a), get_name(f), y] = pipe_cap_arr[1]
                    elseif length(pipe_cap_arr) >= 1
                        @_error "Multiple pipelines found between $(a.start_node) and $(a.end_node)"
                    end
                    if a.start_node == a.end_node
                        Λ_A[get_name(a), get_name(f), y] = 0
                    end
                end
            elseif transport_type[1] == "Shipping"
                distance =
                    ship_dist_df[(pipe_dist_df[!, "Start"].==a.start_node), a.end_node][1]
                l_a[get_name(a), get_name(f)] =
                    distance * commodity_df[flow_commodity_idx, "Loss per kkm"][1]
                for y in years.range
                    c_A[get_name(a), get_name(f), y] =
                        a.cost_factor *
                        distance *
                        commodity_df[flow_commodity_idx, "Operational Cost per kkm $y"][1]
                    c_Δ_A[get_name(a), get_name(f), y] =
                        a.cost_factor *
                        distance *
                        commodity_df[flow_commodity_idx, "Investment Cost per kkm $y"][1]
                    Λ_A[get_name(a), get_name(f), y] = 1e+6
                end
            else
                @_error "$(transport_type[1]) is not a valid transport type"
            end
        end
    end

    for r in arc_repurposing_technologies
        filter_idxs =
            (repurposing_df[!, "Old Flow Commodity"] .== r.from_throughput) .&
            (repurposing_df[!, "New Flow Commodity"] .== r.to_throughput)

        f_RA[r.from_throughput, r.to_throughput] = repurposing_df[filter_idxs, "Repurposing Factor"][1]

        for y in years.range, a in arcs
            distance =
                pipe_dist_df[(pipe_dist_df[!, "Start"].==a.start_node), a.end_node][1]
            c_Δ_RA[get_name(a), r.from_throughput, r.to_throughput, y] =
                a.cost_factor *
                distance *
                repurposing_df[filter_idxs, "Repurposing Cost per kkm $y"][1]
        end
    end

    arc_data =
        ArcData(c_A = c_A, c_Δ_A = c_Δ_A, c_Δ_RA = c_Δ_RA, Λ_A = Λ_A, l_a = l_a, L_A = L_A, f_RA = f_RA)

    return arc_data
end

function get_storage_data(
    datafile,
    storages::Vector{Storage},
    commodities::Vector{Commodity},
    timesteps::Vector{Timestep},
    storage_repurposing_technologies::Vector{RepurposingStorage},
    years::Years,
    timestep_mapping::TimestepMapping,
)
    tec_df = CSV.read(
        joinpath(datafile, "storage", "Technologies.csv"), DataFrame, delim=','
    )
    
    los_df = CSV.read(
        joinpath(datafile, "storage", "Losses.csv"), DataFrame, delim=','
    )
    
    cap_df = CSV.read(
        joinpath(datafile, "storage", "Capacities.csv"), DataFrame, delim=','
    )
    
    repurposing_df = CSV.read(
        joinpath(datafile, "storage", "Repurposing_Data.csv"), DataFrame, delim=','
    )

    Λ_S = JuMP.Containers.DenseAxisArray(
        zeros(length(storages), length(commodities), length(years.range)),
        get_name.(storages),
        get_name.(commodities),
        years.range,
    )

    c_S_in = JuMP.Containers.DenseAxisArray(
        zeros(length(storages), length(commodities), length(years.range)),
        get_name.(storages),
        get_name.(commodities),
        years.range,
    )

    c_S_out = JuMP.Containers.DenseAxisArray(
        zeros(length(storages), length(commodities), length(years.range)),
        get_name.(storages),
        get_name.(commodities),
        years.range,
    )

    c_Δ_S = JuMP.Containers.DenseAxisArray(
        zeros(length(storages), length(commodities), length(years.range)),
        get_name.(storages),
        get_name.(commodities),
        years.range,
    )

    c_Δ_RS = JuMP.Containers.DenseAxisArray(
        zeros(
            length(storages),
            length(commodities),
            length(commodities),
            length(years.range),
        ),
        get_name.(storages),
        get_name.(commodities),
        get_name.(commodities),
        years.range,
    )

    f_RS = JuMP.Containers.DenseAxisArray(
        zeros(
            length(commodities),
            length(commodities),
        ),
        get_name.(commodities),
        get_name.(commodities),
    )

    L_S = JuMP.Containers.DenseAxisArray(zeros(length(commodities)), get_name.(commodities))
    Ω_S = JuMP.Containers.DenseAxisArray(
        zeros(length(storages), length(commodities), length(years.range)),
        get_name.(storages),
        get_name.(commodities),
        years.range,
    )

    l_S_dict = Dict{
        Tuple{
            eltype(get_name.(commodities)),
            eltype(get_name.(timesteps)),
            eltype(get_name.(timesteps)),
        },
        Float64,
    }()
    for f in get_name.(commodities)
        L_S_h = tec_df[tec_df[!, "Commodity"].==f, "Lifetime"]
        if length(L_S_h) == 1
            L_S[f] = L_S_h[1]
        else
            @_warning "Found $(length(L_S_h)) values for storage technology" Commodity = f
        end

        for si in get_name.(timesteps)
            se = timestep_mapping.next_step[si]
            l_S_h = los_df[
                (los_df[
                    !,
                    "Commodity",
                ].==f).&(los_df[
                    !,
                    "Injection Timestep",
                ].==si).&(los_df[!, "Extraction Timestep"].==se),
                "Loss Rate",
            ]
            if length(l_S_h) == 1
                l_S_dict[f, si, se] = l_S_h[1]
            else
                l_S_dict[f, si, se] = 0
                @_warning "Found $(length(l_S_h)) values for storage technology. Losses set to 0." Commodity =
                    f Extraction = se Injection = si
            end
        end

        for w in storages
            for y in years.range
                Λ_S_h = cap_df[
                    (cap_df[!, "Commodity"].==f).&(cap_df[!, "Node"].==get_node(w)),
                    "Capacity $y",
                ]
                if length(Λ_S_h) == 1
                    Λ_S[get_name(w), f, y] = Λ_S_h[1]
                else
                    @_warning "Found $(length(Λ_S_h)) values for storage technology capacity" Storage =
                        get_name(w) Commodity = f Year = y
                end

                Ω_S_h = cap_df[
                    (cap_df[!, "Commodity"].==f).&(cap_df[!, "Node"].==get_node(w)),
                    "Expansion Limit $y",
                ]
                if length(Ω_S_h) == 1
                    Ω_S[get_name(w), f, y] = Ω_S_h[1]
                else
                    @_warning "Found $(length(Ω_S_h)) values for storage technology capacity" Storage =
                        get_name(w) Commodity = f Year = y
                end

                c_Δ_S_h = tec_df[(tec_df[!, "Commodity"].==f), "Investment Cost $y"]
                if length(c_Δ_S_h) == 1
                    c_Δ_S[get_name(w), f, y] = w.cost_factor * c_Δ_S_h[1]
                else
                    @_warning "Found $(length(c_Δ_S_h)) values for storage technology Investment Cost" Storage =
                        get_name(w) Commodity = f Year = y
                end

                c_S_in_h = tec_df[(tec_df[!, "Commodity"].==f), "Injection Cost $y"]
                if length(c_S_in_h) == 1
                    c_S_in[get_name(w), f, y] = w.cost_factor * c_S_in_h[1]
                else
                    c_S_in[get_name(w), f, y] = 0
                    @_warning "Found $(length(c_S_in_h)) values for storage technology Injection Cost, set to 0" Storage =
                        get_name(w) Commodity = f Year = y
                end

                c_S_out_h = tec_df[(tec_df[!, "Commodity"].==f), "Extraction Cost $y"]
                if length(c_S_out_h) == 1
                    c_S_out[get_name(w), f, y] = w.cost_factor * c_S_out_h[1]
                else
                    c_S_out[get_name(w), f, y] = 0
                    @_warning "Found $(length(c_S_out_h)) values for storage technology Extraction Cost, set to 0" Storage =
                        get_name(w) Commodity = f Year = y
                end

            end
        end
    end

    for r in storage_repurposing_technologies
        filter_idxs =
            (repurposing_df[!, "Old Commodity"] .== r.from_input) .&
            (repurposing_df[!, "New Commodity"] .== r.to_input)

        f_RS[r.from_input, r.to_input] = repurposing_df[filter_idxs, "Repurposing Factor"][1]

        for y in years.range, s in storages
            c_Δ_RS[get_name(s), r.from_input, r.to_input, y] =
                s.cost_factor * repurposing_df[filter_idxs, "Repurposing Cost $y"][1]
        end
    end

    l_S = JuMP.Containers.SparseAxisArray(l_S_dict)

    storage_data = StorageData(
        Λ_S = Λ_S,
        c_S_in = c_S_in,
        c_S_out = c_S_out,
        c_Δ_S = c_Δ_S,
        c_Δ_RS = c_Δ_RS,
        l_S = l_S,
        L_S = L_S,
        Ω_S = Ω_S,
        f_RS = f_RS
    )

    return storage_data
end

function get_demand_data(
    datafile,
    nodes::Vector{Node},
    commodities::Vector{Commodity},
    demand_blocks::Vector{DemandBlock},
    timesteps::Vector{Timestep},
    years::Years,
)

    ref_df = CSV.read(
        joinpath(datafile, "demand", "Reference_Data.csv"), DataFrame, delim=','
    )

    α_D = JuMP.Containers.DenseAxisArray(
        zeros(
            length(nodes),
            length(commodities),
            length(demand_blocks),
            length(timesteps),
            length(years.range),
        ),
        get_name.(nodes),
        get_name.(commodities),
        get_name.(demand_blocks),
        get_name.(timesteps),
        years.range,
    )
    β_D = JuMP.Containers.DenseAxisArray(
        zeros(
            length(nodes),
            length(commodities),
            length(demand_blocks),
            length(timesteps),
            length(years.range),
        ),
        get_name.(nodes),
        get_name.(commodities),
        get_name.(demand_blocks),
        get_name.(timesteps),
        years.range,
    )

    for n in get_name.(nodes),
        d in get_name.(commodities),
        b in get_name.(demand_blocks),
        s in get_name.(timesteps),
        y in years.range

        q = ref_df[
            (ref_df[
                !,
                "Commodity",
            ].==d).&(ref_df[!, "Node"].==n).&(ref_df[!, "Timestep"].==s),
            "Consumption $b $y",
        ]
        p = ref_df[
            (ref_df[
                !,
                "Commodity",
            ].==d).&(ref_df[!, "Node"].==n).&(ref_df[!, "Timestep"].==s),
            "Reference Price $b $y",
        ]
        ϵ = ref_df[
            (ref_df[
                !,
                "Commodity",
            ].==d).&(ref_df[!, "Node"].==n).&(ref_df[!, "Timestep"].==s),
            "Price Elasticity $b $y",
        ]
        if (length(q) == 1) && (length(p) == 1) && (length(ϵ) == 1)
            if q[1] <= 1e-6
                α_D[n, d, b, s, y] = 0
                β_D[n, d, b, s, y] = -1
            else
                α_D[n, d, b, s, y] = p[1] - p[1] / ϵ[1]
                β_D[n, d, b, s, y] = p[1] / (q[1] * ϵ[1])
            end
        else
            @_warning "Insufficient or ambiguous demand data, α_D and β_D left at zero" Node =
                n Commodity = d Block = b Timestep = s Year = y
        end
    end

    demand_data = DemandData(α_D = α_D, β_D = β_D)

    return demand_data
end

function get_traders(datafile)
    traders = Trader[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Nodes.csv"), DataFrame, delim=','))
        idx = findfirst(x -> r[Symbol("Nodal Trader")] == get_name(x), traders)
        if !isnothing(idx)
            t = traders[idx]
            push!(t.producers, "P_$(r[:Node])")
        else
            t = Trader(name = r[Symbol("Nodal Trader")], producers = ["P_$(r[:Node])"])
            push!(traders, t)
        end
    end
    return traders
end

function get_converters(datafile)
    converters = Converter[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Nodes.csv"),DataFrame, delim=','))
        c = Converter(
            name = "V_$(r[:Node])",
            node = r[:Node],
            trader = r[Symbol("Nodal Trader")],
            cost_factor = r[Symbol("Cost Factor")],
        )
        push!(converters, c)
    end
    return converters
end

function get_arcs(nodes)
    arcs = TransportArc[]
    for ne in nodes, ni in nodes
        a = TransportArc(
            name = "$(get_name(ne))_to_$(get_name(ni))",
            start_node = get_name(ne),
            end_node = get_name(ni),
            inverse_arc = "$(get_name(ni))_to_$(get_name(ne))",
            cost_factor = min(getfield(ni, :cost_factor), getfield(ne, :cost_factor)),
            iterator = (get_name(ne), get_name(ni)),
        )
        push!(arcs, a)
        push!(ne.starting_arcs, get_name(a))
        push!(ni.ending_arcs, get_name(a))
    end
    return arcs
end

function get_arc_adjacency(datafile, nodes, arcs, commodities)
    arc_adjacency = ArcAdjacencyCommodity()

    df_pipe = CSV.read(
        joinpath(datafile, "transport", "Pipeline_Adjacency.csv"), DataFrame, delim=','
    )
    
    @assert df_pipe.Start == names(df_pipe[!,2:end])
    @assert get_name.(nodes) ⊆ df_pipe.Start
    node_names = df_pipe.Start
    adjacency_pipe = JuMP.Containers.DenseAxisArray(Matrix(df_pipe[!,2:end]), node_names, node_names)
    @assert isequal(adjacency_pipe.data,permutedims(adjacency_pipe.data))

    df_shipping = CSV.read(
        joinpath(datafile, "transport", "Shipping_Adjacency.csv"), DataFrame, delim=','
    )
    
    @assert df_shipping.Start == names(df_shipping[!,2:end])
    @assert get_name.(nodes) ⊆ df_shipping.Start
    node_names = df_shipping.Start
    adjacency_shipping = JuMP.Containers.DenseAxisArray(Matrix(df_shipping[!,2:end]), node_names, node_names)
    @assert isequal(adjacency_shipping.data,permutedims(adjacency_shipping.data))

    for a in arcs, c in commodities
        if c.transport == "Shipping"
            if !ismissing(adjacency_shipping[a.start_node,a.end_node])
                push!(arc_adjacency.AC,(get_name(a),get_name(c)))
                arc_adjacency.is_a_of_c[get_name(a),get_name(c)] = true
            else
                arc_adjacency.is_a_of_c[get_name(a),get_name(c)] = false
            end
        elseif c.transport == "Pipeline"
            if !ismissing(adjacency_pipe[a.start_node,a.end_node])
                push!(arc_adjacency.AC,(get_name(a),get_name(c)))
                arc_adjacency.is_a_of_c[get_name(a),get_name(c)] = true
            else
                arc_adjacency.is_a_of_c[get_name(a),get_name(c)] = false
            end
        else
            @warn "Unassigned Transport Mode" Commodity = c.name
        end
    end

    return arc_adjacency

end

function get_storages(datafile)
    storages = Storage[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Nodes.csv"),DataFrame, delim=','))
        s = Storage(
            name = "S_$(r[:Node])",
            node = r[:Node],
            trader = r[Symbol("Nodal Trader")],
            cost_factor = r[Symbol("Cost Factor")],
        )
        push!(storages, s)
    end
    return storages
end

function get_commodities(datafile)
    commodities = Commodity[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "general_data", "Commodities.csv"),DataFrame, delim=',')
    )
        c = Commodity(name = r[Symbol("Commodity")], transport = "unassigned")
        push!(commodities, c)
    end
    return commodities
end

function get_origins(datafile)
    origins = Origin[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Origins.csv"),DataFrame, delim=','))
        o = Origin(name = r[:Origin])
        push!(origins, o)
    end
    return origins
end

function get_inputs(datafile)
    inputs = Input[]
    for r in
        eachrow(CSV.read(joinpath(datafile, "general_data", "Inputs.csv"),DataFrame, delim=','))
        i = Input(name = r[:Input])
        push!(inputs, i)
    end
    return inputs
end

function get_input_operational_blocks(datafile)
    input_operational_blocks = InputOperationalBlock[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "general_data", "Input_Blocks.csv"),DataFrame, delim=',')
    )
        i = InputOperationalBlock(name = r[Symbol("Input Block")])
        push!(input_operational_blocks, i)
    end
    return input_operational_blocks
end

function get_demand_blocks(datafile)
    demand_blocks = DemandBlock[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "general_data", "Demand_Blocks.csv"),DataFrame; delim=',')
    )
        i = DemandBlock(name = r[Symbol("Demand Blocks")])
        push!(demand_blocks, i)
    end
    return demand_blocks
end

function get_production_technology_data(datafile::String)
    commodities = get_commodities(datafile)
    origins = get_origins(datafile)
    production_technologies = ProductionTechnology[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "production", "Technology.csv"),DataFrame, delim=',')
    )
        c = r[Symbol("Output")]
        o = r[Symbol("Origin")]

        if c in get_name.(commodities) && o in get_name.(origins)
            push!(
                production_technologies,
                ProductionTechnology(
                    name = "$(c)_from_$(o)",
                    commodity = c,
                    origin = o,
                    PT = (c, o),
                ),
            )
        end
    end
    return production_technologies
end

function get_conversion_technology_data(datafile::String)
    commodities = get_commodities(datafile)
    conversion_technologies = ConversionTechnology[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "conversion", "Conversion_Data.csv"),DataFrame, delim=',')
    )
        c_in = r[Symbol("Input Commodity")]
        c_out = r[Symbol("Output Commodity")]

        if c_in in get_name.(commodities) && c_out in get_name.(commodities)
            push!(
                conversion_technologies,
                ConversionTechnology(
                    name = "$(c_in)_to_$(c_out)",
                    input = c_in,
                    output = c_out,
                    CV = (c_in, c_out),
                ),
            )
        end
    end
    return conversion_technologies
end

function get_arc_repurposing_technology(datafile)
    commodities = get_commodities(datafile)
    arc_repurposing_technologies = RepurposingArcs[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "transport", "Repurposing_Data.csv"),DataFrame, delim=',')
    )
        c_old = r[Symbol("Old Flow Commodity")]
        c_new = r[Symbol("New Flow Commodity")]

        if c_old in get_name.(commodities) && c_new in get_name.(commodities)
            push!(
                arc_repurposing_technologies,
                RepurposingArcs(
                    name = "$(c_old)_to_$(c_new)",
                    from_throughput = c_old,
                    to_throughput = c_new,
                    RA = (c_old, c_new),
                ),
            )
        end
    end
    return arc_repurposing_technologies
end

function get_storage_repurposing_technology(datafile)
    commodities = get_commodities(datafile)
    storage_repurposing_technologies = RepurposingStorage[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "storage", "Repurposing_Data.csv"),DataFrame, delim=',')
    )
        c_old = r[Symbol("Old Commodity")]
        c_new = r[Symbol("New Commodity")]

        if c_old in get_name.(commodities) && c_new in get_name.(commodities)
            push!(
                storage_repurposing_technologies,
                RepurposingStorage(
                    name = "$(c_old)_to_$(c_new)",
                    from_input = c_old,
                    to_input = c_new,
                    RS = (c_old, c_new),
                ),
            )
        end
    end
    return storage_repurposing_technologies
end

function get_conversion_repurposing_technology(datafile)
    commodities = get_commodities(datafile)
    repurposing_technology = RepurposingConversion[]
    for r in eachrow(
        CSV.read(joinpath(datafile, "conversion", "Repurposing.csv"),DataFrame, delim=',')
    )
        c_in_old = r[Symbol("From Input Commodity")]
        c_out_old = r[Symbol("From Output Commodity")]
        c_in_new = r[Symbol("To Input Commodity")]
        c_out_new = r[Symbol("To Output Commodity")]

        if c_in_old in get_name.(commodities) &&
           c_out_old in get_name.(commodities) &&
           c_in_new in get_name.(commodities) &&
           c_out_new in get_name.(commodities)
            push!(
                repurposing_technology,
                RepurposingConversion(
                    name = "From_$(c_in_old)_to_$(c_out_old)_to_$(c_in_new)_to_$(c_out_new)",
                    from_input = c_in_old,
                    from_output = c_out_old,
                    to_input = c_in_new,
                    to_output = c_out_new,
                    RV = ((c_in_old, c_out_old), (c_in_new, c_out_new)),
                ),
            )
        end
    end
    return repurposing_technology
end


"""
    get_HydrOGEnMod_data(data; logfile = "")

Get model data from the specified data path. 

A file where to write the log records can be specified via keyword arguments. 

# Examples
```julia-repl
julia> using HydrOGEnMod
julia> data = get_HydrOGEnMod_data("path/to/my/data");
```
"""
function get_HydrOGEnMod_data(
    data;
    logfile = "",
)
    starttime = time()

    @_status "Loading Data" Progress = "Reading in Timesteps." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    timesteps = get_timesteps(data)

    @_status "Loading Data" Progress = "Reading in Timestep Mapping." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    timestep_mapping = get_timestep_mapping(timesteps)

    @_status "Loading Data" Progress = "Reading in Years." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    discount, years = get_years(data)

    @_status "Loading Data" Progress = "Reading in Nodes." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    nodes = get_nodes(data)

    @_status "Loading Data" Progress = "Reading in Commodities." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    commodities = get_commodities(data)

    @_status "Loading Data" Progress = "Reading in Origins." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    origins = get_origins(data)

    @_status "Loading Data" Progress = "Reading in Inputs." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    inputs = get_inputs(data)

    @_status "Loading Data" Progress = "Reading in Input Blocks." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    input_operational_blocks = get_input_operational_blocks(data)

    @_status "Loading Data" Progress = "Reading in Demand Blocks." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    demand_blocks = get_demand_blocks(data)

    @_status "Loading Data" Progress = "Reading in Producers." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    producers = get_producers(data)

    @_status "Loading Data" Progress = "Reading in Production Technology." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    production_technologies = get_production_technology_data(data)

    @_status "Loading Data" Progress = "Reading in Traders." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    traders = get_traders(data)

    @_status "Loading Data" Progress = "Reading in Converters." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    converters = get_converters(data)

    @_status "Loading Data" Progress = "Reading in Nodes." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    arcs = get_arcs(nodes)

    @_status "Loading Data" Progress = "Reading in Arc Repurposing Technologies." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    repurposing_arc_technologies = get_arc_repurposing_technology(data)

    @_status "Loading Data" Progress = "Reading in Storages." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    storages = get_storages(data)

    @_status "Loading Data" Progress = "Reading in Storage Repurposing Technologies." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    repurposing_storage_technologies = get_storage_repurposing_technology(data)

    @_status "Loading Data" Progress = "Reading in Conversion Technologies." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    conversion_technologies = get_conversion_technology_data(data)

    @_status "Loading Data" Progress = "Reading in Conversion Repurposing Technologies." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    repurposing_conversion_technologies = get_conversion_repurposing_technology(data)

    @_status "Loading Data" Progress = "Reading in Input Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    input_data =
        get_input_data(data, producers, inputs, input_operational_blocks, timesteps, years)

    @_status "Loading Data" Progress = "Reading in Production Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    production_data =
        get_production_data(data, inputs, producers, commodities, origins, years)

    @_status "Loading Data" Progress = "Reading in Trade Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    trade_data = get_trade_data(data, traders, nodes, commodities, origins, years)

    @_status "Loading Data" Progress = "Reading in Conversion Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    conversion_data = get_conversion_data(
        data,
        conversion_technologies,
        converters,
        commodities,
        commodities,
        repurposing_conversion_technologies,
        years,
    )

    @_status "Loading Data" Progress = "Reading in Arc Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    arc_data = get_arc_data(data, arcs, commodities, repurposing_arc_technologies, years)

    @_status "Loading Data" Progress = "Reading in Arc Adjacency." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    arc_adjacency = get_arc_adjacency(data, nodes, arcs, commodities)

    @_status "Loading Data" Progress = "Reading in Storage Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    storage_data = get_storage_data(
        data,
        storages,
        commodities,
        timesteps,
        repurposing_storage_technologies,
        years,
        timestep_mapping,
    )

    @_status "Loading Data" Progress = "Reading in Demand Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    demand_data = get_demand_data(data, nodes, commodities, demand_blocks, timesteps, years)

    @_status "Loading Data" Progress = "Creating Model Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    model_data = ModelData(
        timesteps = timesteps,
        timestep_mapping = timestep_mapping,
        years = years,
        inputs = inputs,
        input_operational_blocks = input_operational_blocks,
        demand_blocks = demand_blocks,
        commodities = commodities,
        origins = origins,
        nodes = nodes,
        producers = producers,
        production_technologies = production_technologies,
        traders = traders,
        converters = converters,
        arcs = arcs,
        repurposing_arc_technologies = repurposing_arc_technologies,
        arc_adjacency = arc_adjacency,
        storages = storages,
        repurposing_storage_technologies = repurposing_storage_technologies,
        conversion_technologies = conversion_technologies,
        repurposing_conversion_technologies = repurposing_conversion_technologies,
        input_data = input_data,
        production_data = production_data,
        trade_data = trade_data,
        conversion_data = conversion_data,
        arc_data = arc_data,
        storage_data = storage_data,
        demand_data = demand_data,
        days = JuMP.Containers.DenseAxisArray(
            vcat([s.days for s in timesteps], [years.days]),
            vcat([s.name for s in timesteps], ["year"]),
        ),
        discount = discount,
    )

    @_status "Loading Data" Progress = "Returning Model Data." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile

    return model_data
end
