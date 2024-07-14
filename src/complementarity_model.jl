"""
    build_complementarity_model(data::ModelData, BIG = 1e+6, logfile = "")

Build a JuMP model with complementarity extension from the underlying model data. 

A logfile and upper bounds on variables can be specified. 

# Examples
```julia-repl
julia> using HydrOGEnMod
julia> data = get_HydrOGEnMod_data("path/to/my/data");
julia> model = build_complementarity_model(data);
```
"""
function build_complementarity_model(data::ModelData, BIG = 1e+6, logfile = "")

    starttime = time()

    @_status "Building Model" Progress = "Creating Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    model = MCPModel()

    @_status "Building Model" Progress = "Creating Variables." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @variable(
        model,
        0 <=
        q_I[
            p = get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_P_to_T[
            get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_I[
            get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_P[
            get_name.(data.producers),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        ϕ_P[
            get_name.(data.producers),
            i = get_name.(data.inputs),
            m = get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        λ_I[
            get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            m = get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        λ_P[
            get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m = get_name.(data.timesteps),
            data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        ω_P[
            get_name.(data.producers),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        ω_I[
            get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_T_to_D[
            get_name.(data.traders),
            get_name.(data.nodes),
            get_name.(data.commodities),
            get_name.(data.demand_blocks),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_T_from_P[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_T_to_V[
            get_name.(data.traders),
            get_name.(data.nodes),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_T_from_V[
            get_name.(data.traders),
            get_name.(data.nodes),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_T_to_S[
            get_name.(data.traders),
            get_name.(data.nodes),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_T_from_S[
            get_name.(data.traders),
            get_name.(data.nodes),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_T[
            t = get_name.(data.traders),
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            s = get_name.(data.timesteps),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        ϕ_T[
            get_name.(data.traders),
            get_name.(data.nodes),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        λ_T[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            y = data.years.range;
            (t, n, c, o, y) in all_indices(data.trade_data.Λ_T),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_V[
            get_name.(data.converters),
            get_name.(data.traders),
            c_i = unique(get_input.(data.conversion_technologies)),
            c_o = unique(get_output.(data.conversion_technologies)),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_V[
            get_name.(data.converters),
            c_i = unique(get_input.(data.conversion_technologies)),
            c_o = unique(get_output.(data.conversion_technologies)),
            data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_RV[
            get_name.(data.converters),
            c_in_old = unique(get_old_input.(data.repurposing_conversion_technologies)),
            c_out_old = unique(get_old_output.(data.repurposing_conversion_technologies)),
            c_in_new = unique(get_new_input.(data.repurposing_conversion_technologies)),
            c_out_new = unique(get_new_output.(data.repurposing_conversion_technologies)),
            y in data.years.range;
            ((c_in_old, c_out_old), (c_in_new, c_out_new)) in
            get_repurposing_technology.(data.repurposing_conversion_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        λ_V[
            get_name.(data.converters),
            c_i = unique(get_input.(data.conversion_technologies)),
            c_o = unique(get_output.(data.conversion_technologies)),
            get_name.(data.timesteps),
            data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_A[
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            s = get_name.(data.timesteps),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_A[
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_RA[
            a = get_name.(data.arcs),
            c_old = get_from_throughput.(data.repurposing_arc_technologies),
            c_new = get_to_throughput.(data.repurposing_arc_technologies),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c_old],
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        λ_A[
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            m = get_name.(data.timesteps),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ] <=
        BIG
    )

    @variable(
        model,
        δ_A[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ]
    )

    @variable(
        model,
        δ_RA[
            a in get_name.(data.arcs),
            c_old in get_name.(data.commodities),
            c_new in get_name.(data.commodities),
            y in data.years.range;
            (
                (c_old, c_new) in
                get_repurposing_technology.(data.repurposing_arc_technologies)
            ) && (data.arc_adjacency.is_a_of_c[a, c_old]),
        ]
    )

    @variable(
        model,
        0 <=
        q_S[
            get_name.(data.storages),
            get_name.(data.traders),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_S_in[
            get_name.(data.storages),
            get_name.(data.traders),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        q_S_out[
            get_name.(data.storages),
            get_name.(data.traders),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_S[get_name.(data.storages), get_name.(data.commodities), data.years.range] <=
        BIG
    )

    @variable(
        model,
        0 <=
        Δ_RS[
            s = get_name.(data.storages),
            r = unique(get_from_input.(data.repurposing_storage_technologies)),
            c = unique(get_to_input.(data.repurposing_storage_technologies)),
            data.years.range;
            (r, c) ∈ get_repurposing_technology.(data.repurposing_storage_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        λ_S[
            get_name.(data.storages),
            get_name.(data.commodities),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        ϕ_S[
            get_name.(data.storages),
            get_name.(data.traders),
            get_name.(data.commodities),
            get_name.(data.origins),
            get_name.(data.timesteps),
            data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        ω_S[get_name.(data.storages), get_name.(data.commodities), data.years.range] <=
        BIG
    )

    @variable(
        model,
        0 <=
        π_P[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        π_T_to_D[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            b in get_name.(data.demand_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        π_T_to_V[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        π_V_to_T[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        π_A[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            m in get_name.(data.timesteps),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        π_T_to_S[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ] <=
        BIG
    )

    @variable(
        model,
        0 <=
        π_S_to_T[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ] <=
        BIG
    )

    @_status "Building Model" Progress = "Creating Demand Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        demand[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            b in get_name.(data.demand_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        sum(
            q_T_to_D[t, n, c, b, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        )
    )

    @_status "Building Model" Progress = "Creating Commodity Price Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        prices[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            b in get_name.(data.demand_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        data.demand_data.α_D[n, c, b, m, y] +
        data.demand_data.β_D[n, c, b, m, y] * demand[n, c, b, m, y]
    )

    @_status "Building Model" Progress = "Creating Gross Surplus Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        gross_surplus[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            b in get_name.(data.demand_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        data.weights[m] / 2 *
        data.demand_data.β_D[n, c, b, m, y] *
        (demand[n, c, b, m, y])^2 +
        data.weights[m] * data.demand_data.α_D[n, c, b, m, y] * demand[n, c, b, m, y]
    )

    @_status "Building Model" Progress = "Creating Market Power Adjustment Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        market_power_adjustment[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            b in get_name.(data.demand_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        0.5 * sum(
            data.trade_data.NC[t, n, c] *
            data.demand_data.β_D[n, c, b, m, y] *
            sum(q_T_to_D[t, n, c, b, o, m, y] for o in get_name.(data.origins))^2 for
            t in get_name.(data.traders)
        )
    )

    @_status "Building Model" Progress = "Creating Input Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        input_cost[
            p in get_name.(data.producers),
            i in get_name.(data.inputs),
            b in get_name.(data.input_operational_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        data.weights[m] * (
            data.input_data.c_Pl[p, i, b, m, y] * q_I[p, i, b, m, y] +
            0.5 * data.input_data.c_Pq[p, i, b, m, y] * (q_I[p, i, b, m, y])^2
        )
    )

    @_status "Building Model" Progress = "Creating Yearly Input Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        yearly_input_procurement[
            p in get_name.(data.producers),
            i in get_name.(data.inputs),
            y in data.years.range,
        ],
        sum(
            data.weights[m] * q_I[p, i, b, m, y] for
            b in get_name.(data.input_operational_blocks), m in get_name.(data.timesteps)
        )
    )

    @_status "Building Model" Progress = "Creating Input Capacity Expansion Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        input_expansion_cost[
            p in get_name.(data.producers),
            i in get_name.(data.inputs),
            b in get_name.(data.input_operational_blocks),
            y in data.years.range,
        ],
        data.input_data.c_Δ_I[p, i, b, y] * Δ_I[p, i, b, y] / data.years.step
    )

    @_status "Building Model" Progress = "Creating Production Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        production_cost[
            p in get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        data.weights[m] * data.production_data.c_P[p, c, o, y] * q_P_to_T[p, c, o, m, y]
    )

    @_status "Building Model" Progress = "Creating Production Capacity Expansion Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        production_expansion_cost[
            p in get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            y in data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        data.production_data.c_Δ_P[p, c, o, y] / data.years.step * Δ_P[p, c, o, y]
    )

    @_status "Building Model" Progress = "Creating Conversion Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        conversion_cost[
            v in get_name.(data.converters),
            t in get_name.(data.traders),
            c_i in unique(get_input.(data.conversion_technologies)),
            c_o in unique(get_output.(data.conversion_technologies)),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ],
        data.weights[m] *
        data.conversion_data.c_V[v, c_i, c_o, y] *
        q_V[v, t, c_i, c_o, o, m, y]
    )

    @_status "Building Model" Progress = "Creating Conversion Capacity Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        conversion_expansion_cost[
            v in get_name.(data.converters),
            c_i in unique(get_input.(data.conversion_technologies)),
            c_o in unique(get_output.(data.conversion_technologies)),
            y in data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ],
        data.conversion_data.c_Δ_V[v, c_i, c_o, y] / data.years.step * Δ_V[v, c_i, c_o, y]
    )

    @_status "Building Model" Progress = "Creating Conversion Repurposing Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        conversion_repurposing_cost[
            v in get_name.(data.converters),
            c_in_old in unique(get_old_input.(data.repurposing_conversion_technologies)),
            c_out_old in unique(get_old_output.(data.repurposing_conversion_technologies)),
            c_in_new in unique(get_new_input.(data.repurposing_conversion_technologies)),
            c_out_new in unique(get_new_output.(data.repurposing_conversion_technologies)),
            y in data.years.range;
            ((c_in_old, c_out_old), (c_in_new, c_out_new)) in
            get_repurposing_technology.(data.repurposing_conversion_technologies),
        ],
        data.conversion_data.c_Δ_RV[v, c_in_old, c_out_old, c_in_new, c_out_new, y] /
        data.years.step * Δ_RV[v, c_in_old, c_out_old, c_in_new, c_out_new, y]
    )

    @_status "Building Model" Progress = "Creating Transport Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        transport_cost[
            t in get_name.(data.traders),
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        data.weights[m] * data.arc_data.c_A[a, c, y] * q_T[t, a, c, o, m, y]
    )

    @_status "Building Model" Progress = "Creating Transport Capacity Expansion Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        transport_expansion_cost[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        data.arc_data.c_Δ_A[a, c, y] / data.years.step * Δ_A[a, c, y]
    )

    @_status "Building Model" Progress = "Creating Transport Repurposing Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        transport_repurposing_cost[
            a in get_name.(data.arcs),
            c_old in get_from_throughput.(data.repurposing_arc_technologies),
            c_new in get_to_throughput.(data.repurposing_arc_technologies),
            y in data.years.range;
            (
                (c_old, c_new) in
                get_repurposing_technology.(data.repurposing_arc_technologies)
            ) & data.arc_adjacency.is_a_of_c[a, c_old],
        ],
        data.arc_data.c_Δ_RA[a, c_old, c_new, y] / data.years.step *
        Δ_RA[a, c_old, c_new, y]
    )

    @_status "Building Model" Progress = "Creating Aggregated Arc Flow Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        yearly_arc_flows[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            y in data.years.range,
        ],
        sum(
            data.weights[m] * q_T[t, a, c, o, m, y] for
            t in get_name.(data.traders), o in get_name.(data.origins),
            m in get_name.(data.timesteps) if data.arc_adjacency.is_a_of_c[a, c]
        )
    )

    @_status "Building Model" Progress = "Creating Storage Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        storage_cost[
            s in get_name.(data.storages),
            t in get_name.(data.traders),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        data.weights[m] * data.storage_data.c_S_in[s, c, y] * q_S_in[s, t, c, o, m, y] +
        data.weights[m] * data.storage_data.c_S_out[s, c, y] * q_S_out[s, t, c, o, m, y]
    )

    @_status "Building Model" Progress = "Creating Storage Capacity Expansion Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        storage_expansion_cost[
            s in get_name.(data.storages),
            c in get_name.(data.commodities),
            y in data.years.range,
        ],
        data.storage_data.c_Δ_S[s, c, y] / data.years.step * Δ_S[s, c, y]
    )

    @_status "Building Model" Progress = "Creating Storage Repurposing Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        storage_repurposing_cost[
            s in get_name.(data.storages),
            r in unique(get_from_input.(data.repurposing_storage_technologies)),
            c in unique(get_to_input.(data.repurposing_storage_technologies)),
            y in data.years.range;
            (r, c) ∈ get_repurposing_technology.(data.repurposing_storage_technologies),
        ],
        data.storage_data.c_Δ_RS[s, r, c, y] / data.years.step * Δ_RS[s, r, c, y]
    )

    @_status "Building Model" Progress = "Creating LHS Expressions." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile

    @mapping(
        model,
        LHS_q_I[
            p = get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        data.discount[y] *
        data.weights[m] *
        (
            data.input_data.c_Pl[p, i, b, m, y] +
            data.input_data.c_Pq[p, i, b, m, y] * q_I[p, i, b, m, y]
        ) - ϕ_P[p, i, m, y] + λ_I[p, i, b, m, y]
    )

    @mapping(
        model,
        LHS_q_P_to_T[
            p = get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        data.discount[y] *
        data.weights[m] *
        (
            -π_P[
                get_node(data.producers[findfirst(x -> x.name == p, data.producers)]),
                c,
                o,
                m,
                y,
            ] + data.production_data.c_P[p, c, o, y]
        ) +
        sum(
            data.production_data.fi_P[c, i, o] * ϕ_P[p, i, m, y] for
            i in get_name.(data.inputs)
        ) +
        λ_P[p, c, o, m, y]
    )

    @mapping(
        model,
        LHS_Δ_I[
            p = get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            y = data.years.range,
        ],
        data.discount[y] / data.years.step * (data.input_data.c_Δ_I[p, i, b, y]) - sum(
            data.input_data.av_I[p, i, b, m] * λ_I[p, i, b, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.input_data.L_I[i],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        ) + sum(
            ω_I[p, i, b, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.input_data.L_I[i],
                    data.years.last,
                )
        )
    )

    @mapping(
        model,
        LHS_Δ_P[
            p = get_name.(data.producers),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            y = data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        data.discount[y] / data.years.step * data.production_data.c_Δ_P[p, c, o, y] - sum(
            λ_P[p, c, o, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.production_data.L_P[c, o],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        ) + ω_P[p, c, o, y]
    )

    @mapping(
        model,
        LHS_ϕ_P[
            p = get_name.(data.producers),
            i = get_name.(data.inputs),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        sum(q_I[p, i, b, m, y] for b in get_name.(data.input_operational_blocks)) - sum(
            data.production_data.fi_P[c, i, o] * q_P_to_T[p, c, o, m, y] for
            o in get_name.(data.origins), c in get_name.(data.commodities) if
            (c, o) in get_production_technology.(data.production_technologies)
        )
    )

    @mapping(
        model,
        LHS_λ_I[
            p = get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        data.input_data.av_I[p, i, b, m] * (
            data.input_data.Λ_I[p, i, b, y] + sum(
                Δ_I[p, i, b, ys] for ys =
                    max(y - data.input_data.L_I[i], data.years.start):data.years.step:(y-data.years.step)
            )
        ) - q_I[p, i, b, m, y]
    )

    @mapping(
        model,
        LHS_λ_P[
            p = get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        data.production_data.Λ_P[p, c, o, y] + sum(
            Δ_P[p, c, o, ys] for ys =
                max(y - data.production_data.L_P[c, o], data.years.start):data.years.step:(y-data.years.step)
        ) - q_P_to_T[p, c, o, m, y]
    )

    @mapping(
        model,
        LHS_ω_P[
            p = get_name.(data.producers),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            y = data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        data.production_data.Ω_P[p, c, o, y] - Δ_P[p, c, o, y]
    )

    @mapping(
        model,
        LHS_ω_I[
            p = get_name.(data.producers),
            i = get_name.(data.inputs),
            b = get_name.(data.input_operational_blocks),
            y = data.years.range,
        ],
        data.input_data.Ω_I[p, i, b, y] - sum(
            Δ_I[p, i, b, ys] for ys =
                max(y - data.input_data.L_I[i], data.years.start):data.years.step:(y-data.years.step)
        )
    )

    @mapping(
        model,
        LHS_q_T_to_D[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            b = get_name.(data.demand_blocks),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        data.discount[y] *
        data.weights[m] *
        (
            -data.trade_data.NC[t, n, c] *
            data.demand_data.β_D[n, c, b, m, y] *
            q_T_to_D[t, n, c, b, o, m, y] -
            data.trade_data.NC[t, n, c] * prices[n, c, b, m, y] -
            (1 - data.trade_data.NC[t, n, c]) * π_T_to_D[n, c, b, m, y]
        ) +
        ϕ_T[t, n, c, o, m, y] +
        sum(
            data.weights[m] * λ_T[t_, n_, c_, o_, y_] for
            (t_, n_, c_, o_, y_) in all_indices(data.trade_data.Λ_T) if
            (t_, n_, c_, o_, y_) == (t, n, c, o, y)
        )
    )

    @mapping(
        model,
        LHS_q_T_from_P[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        data.discount[y] * data.weights[m] * π_P[n, c, o, m, y] - ϕ_T[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_q_T_to_V[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        ϕ_T[t, n, c, o, m, y] -
        data.discount[y] * data.weights[m] * π_T_to_V[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_q_T_from_V[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        data.discount[y] * data.weights[m] * π_V_to_T[t, n, c, o, m, y] -
        ϕ_T[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_q_T_to_S[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        ϕ_T[t, n, c, o, m, y] -
        data.discount[y] * data.weights[m] * π_T_to_S[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_q_T_from_S[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        data.discount[y] * data.weights[m] * π_S_to_T[t, n, c, o, m, y] -
        ϕ_T[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_q_T[
            t = get_name.(data.traders),
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        data.discount[y] * data.weights[m] * π_A[a, c, m, y] +
        (1 + data.arc_data.l_a[a, c]) *
        ϕ_T[t, data.arcs[findfirst(x -> x.name == a, data.arcs)].start_node, c, o, m, y] -
        ϕ_T[t, data.arcs[findfirst(x -> x.name == a, data.arcs)].end_node, c, o, m, y]
    )

    @mapping(
        model,
        LHS_ϕ_T[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        sum(
            q_T[t, a, c, o, m, y] for
            a in data.nodes[findfirst(x -> x.name == n, data.nodes)].ending_arcs if
            data.arc_adjacency.is_a_of_c[a, c]
        ) +
        sum(
            q_P_to_T[p, c, o, m, y] for
            p in [data.nodes[findfirst(x -> x.name == n, data.nodes)].producer] if
            data.nodes[findfirst(x -> x.name == n, data.nodes)].producer in
            data.traders[findfirst(x -> x.name == t, data.traders)].producers &&
            (c, o) in get_production_technology.(data.production_technologies)
        ) +
        q_T_from_V[t, n, c, o, m, y] +
        q_T_from_S[t, n, c, o, m, y] - sum(
            (1 + data.arc_data.l_a[a, c]) * q_T[t, a, c, o, m, y] for
            a in data.nodes[findfirst(x -> x.name == n, data.nodes)].starting_arcs if
            data.arc_adjacency.is_a_of_c[a, c]
        ) - sum(q_T_to_D[t, n, c, b, o, m, y] for b in get_name.(data.demand_blocks)) -
        q_T_to_V[t, n, c, o, m, y] - q_T_to_S[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_λ_T[
            t = get_name.(data.traders),
            n = get_name.(data.nodes),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            y = data.years.range;
            (t, n, c, o, y) in all_indices(data.trade_data.Λ_T),
        ],
        data.trade_data.Λ_T[t, n, c, o, y] - sum(
            data.weights[m] *
            sum(q_T_to_D[t, n, c, b, o, m, y] for b in get_name.(data.demand_blocks)) for
            m in get_name.(data.timesteps)
        )
    )

    @mapping(
        model,
        LHS_q_V[
            v = get_name.(data.converters),
            t = get_name.(data.traders),
            c_i = unique(get_input.(data.conversion_technologies)),
            c_o = unique(get_output.(data.conversion_technologies)),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ],
        data.discount[y] *
        data.weights[m] *
        (
            -π_V_to_T[
                t,
                get_node(data.converters[findfirst(x -> x.name == v, data.converters)]),
                c_o,
                o,
                m,
                y,
            ] +
            data.conversion_data.fi_V[c_i, c_o] * π_T_to_V[
                t,
                get_node(data.converters[findfirst(x -> x.name == v, data.converters)]),
                c_i,
                o,
                m,
                y,
            ] +
            data.conversion_data.c_V[v, c_i, c_o, y]
        ) + λ_V[v, c_i, c_o, m, y]
    )

    @mapping(
        model,
        LHS_Δ_V[
            v = get_name.(data.converters),
            c_i = unique(get_input.(data.conversion_technologies)),
            c_o = unique(get_output.(data.conversion_technologies)),
            y = data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ],
        data.discount[y] / data.years.step * data.conversion_data.c_Δ_V[v, c_i, c_o, y] -
        sum(
            λ_V[v, c_i, c_o, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.conversion_data.L_V[c_i, c_o],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        )
    )

    @mapping(
        model,
        LHS_Δ_RV[
            v = get_name.(data.converters),
            c_in_old = unique(get_old_input.(data.repurposing_conversion_technologies)),
            c_out_old = unique(get_old_output.(data.repurposing_conversion_technologies)),
            c_in_new = unique(get_new_input.(data.repurposing_conversion_technologies)),
            c_out_new = unique(get_new_output.(data.repurposing_conversion_technologies)),
            y = data.years.range;
            ((c_in_old, c_out_old), (c_in_new, c_out_new)) in
            get_repurposing_technology.(data.repurposing_conversion_technologies),
        ],
        data.discount[y] / data.years.step *
        data.conversion_data.c_Δ_RV[v, c_in_old, c_out_old, c_in_new, c_out_new, y] - sum(
            data.conversion_data.f_RV[c_in_old, c_out_old, c_in_new, c_out_new] *
            λ_V[v, c_in_new, c_out_new, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.conversion_data.L_V[c_in_new, c_out_new],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        ) + sum(
            λ_V[v, c_in_old, c_out_old, m, ys] for
            ys = (y+data.years.step):data.years.step:data.years.last,
            m in get_name.(data.timesteps)
        )
    )

    @mapping(
        model,
        LHS_λ_V[
            v = get_name.(data.converters),
            c_i = unique(get_input.(data.conversion_technologies)),
            c_o = unique(get_output.(data.conversion_technologies)),
            m = get_name.(data.timesteps),
            y = data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ],
        data.conversion_data.Λ_V[v, c_i, c_o, y] +
        sum(
            Δ_V[v, c_i, c_o, ys] for ys =
                max(y - data.conversion_data.L_V[c_i, c_o], data.years.start):data.years.step:(y-data.years.step)
        ) +
        sum(
            data.conversion_data.f_RV[c_in_old, c_out_old, c_in_new, c_out_new] *
            Δ_RV[v, c_in_old, c_out_old, c_in_new, c_out_new, ys] for
            ((c_in_old, c_out_old), (c_in_new, c_out_new)) in
            get_repurposing_technology.(data.repurposing_conversion_technologies), ys =
                max(y - data.conversion_data.L_V[c_i, c_o], data.years.start):data.years.step:(y-data.years.step) if
            (c_in_new, c_out_new) == (c_i, c_o)
        ) - sum(
            Δ_RV[v, c_in_old, c_out_old, c_in_new, c_out_new, ys] for
            ((c_in_old, c_out_old), (c_in_new, c_out_new)) in
            get_repurposing_technology.(data.repurposing_conversion_technologies),
            ys = data.years.start:data.years.step:(y-data.years.step) if
            (c_in_old, c_out_old) == (c_i, c_o)
        ) - sum(
            q_V[v, t, c_i, c_o, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        )
    )

    @mapping(
        model,
        LHS_q_A[
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            m = get_name.(data.timesteps),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        data.discount[y] *
        data.weights[m] *
        (-π_A[a, c, m, y] + data.arc_data.c_A[a, c, y]) + λ_A[a, c, m, y]
    )

    @mapping(
        model,
        LHS_Δ_A[
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        0.5 * data.discount[y] / data.years.step * data.arc_data.c_Δ_A[a, c, y] - sum(
            λ_A[a, c, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.arc_data.L_A[c],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        ) + δ_A[a, c, y] -
        δ_A[data.arcs[findfirst(x -> get_name(x) == a, data.arcs)].inverse_arc, c, y]
    )

    @mapping(
        model,
        LHS_Δ_RA[
            a = get_name.(data.arcs),
            c_old = get_from_throughput.(data.repurposing_arc_technologies),
            c_new = get_to_throughput.(data.repurposing_arc_technologies),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c_old],
        ],
        0.5 * data.discount[y] / data.years.step *
        data.arc_data.c_Δ_RA[a, c_old, c_new, y] - sum(
            data.arc_data.f_RA[c_old, c_new] * λ_A[a, c_new, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.arc_data.L_A[c_new],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        ) +
        sum(
            λ_A[a, c_old, m, ys] for
            ys = (y+data.years.step):data.years.step:data.years.last,
            m in get_name.(data.timesteps)
        ) +
        δ_RA[a, c_old, c_new, y] - δ_RA[
            data.arcs[findfirst(x -> get_name(x) == a, data.arcs)].inverse_arc,
            c_old,
            c_new,
            y,
        ]
    )

    @mapping(
        model,
        LHS_λ_A[
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            m = get_name.(data.timesteps),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        data.arc_data.Λ_A[a, c, y] +
        sum(
            Δ_A[a, c, ys] for ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step)
        ) +
        sum(
            data.arc_data.f_RA[c_old, c_new] * Δ_RA[a, c_old, c_new, ys] for
            (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_arc_technologies), ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step) if
            (c_new) == c
        ) - sum(
            Δ_RA[a, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_arc_technologies),
            ys = data.years.start:data.years.step:(y-data.years.step) if (c_old) == c
        ) - q_A[a, c, m, y]
    )

    @mapping(
        model,
        LHS_δ_A[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        Δ_A[a, c, y] -
        Δ_A[data.arcs[findfirst(x -> get_name(x) == a, data.arcs)].inverse_arc, c, y]
    )

    @mapping(
        model,
        LHS_δ_RA[
            a in get_name.(data.arcs),
            c_old in get_name.(data.commodities),
            c_new in get_name.(data.commodities),
            y in data.years.range;
            (
                (c_old, c_new) in
                get_repurposing_technology.(data.repurposing_arc_technologies)
            ) && (data.arc_adjacency.is_a_of_c[a, c_old]),
        ],
        Δ_RA[a, c_old, c_new, y] - Δ_RA[
            data.arcs[findfirst(x -> get_name(x) == a, data.arcs)].inverse_arc,
            c_old,
            c_new,
            y,
        ]
    )

    @mapping(
        model,
        LHS_q_S[
            s = get_name.(data.storages),
            t = get_name.(data.traders),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        λ_S[s, c, m, y] -
        (1 - data.storage_data.l_S[c, m, data.timestep_mapping.next_step[m]]) *
        ϕ_S[s, t, c, o, m, y] + ϕ_S[s, t, c, o, data.timestep_mapping.previous_step[m], y]
    )

    @mapping(
        model,
        LHS_q_S_in[
            s = get_name.(data.storages),
            t = get_name.(data.traders),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        data.discount[y] *
        data.weights[m] *
        (
            π_T_to_S[
                t,
                get_node(data.storages[findfirst(x -> x.name == s, data.storages)]),
                c,
                o,
                m,
                y,
            ] + data.storage_data.c_S_in[s, c, y]
        ) -
        (1 - data.storage_data.l_S[c, m, data.timestep_mapping.next_step[m]]) *
        data.weights[m] *
        ϕ_S[s, t, c, o, m, y]
    )

    @mapping(
        model,
        LHS_q_S_out[
            s = get_name.(data.storages),
            t = get_name.(data.traders),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        -data.discount[y] *
        data.weights[m] *
        (
            π_S_to_T[
                t,
                get_node(data.storages[findfirst(x -> x.name == s, data.storages)]),
                c,
                o,
                m,
                y,
            ] - data.storage_data.c_S_out[s, c, y]
        ) +
        (1 - data.storage_data.l_S[c, m, data.timestep_mapping.next_step[m]]) *
        data.weights[m] *
        ϕ_S[s, t, c, o, m, y]
    )

    @mapping(
        model,
        LHS_Δ_S[
            s = get_name.(data.storages),
            c = get_name.(data.commodities),
            y = data.years.range,
        ],
        data.discount[y] / data.years.step * data.storage_data.c_Δ_S[s, c, y] - sum(
            λ_S[s, c, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.storage_data.L_S[c],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        ) + sum(
            ω_S[s, c, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.storage_data.L_S[c],
                    data.years.last,
                )
        )
    )

    @mapping(
        model,
        LHS_Δ_RS[
            s = get_name.(data.storages),
            r = unique(get_from_input.(data.repurposing_storage_technologies)),
            c = unique(get_to_input.(data.repurposing_storage_technologies)),
            y = data.years.range;
            (r, c) ∈ get_repurposing_technology.(data.repurposing_storage_technologies),
        ],
        data.discount[y] / data.years.step * data.storage_data.c_Δ_RS[s, r, c, y] - sum(
            data.storage_data.f_RS[r, c] * λ_S[s, c, m, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.storage_data.L_S[c],
                    data.years.last,
                ), m in get_name.(data.timesteps)
        ) +
        sum(
            λ_S[s, r, m, ys] for ys = (y+data.years.step):data.years.step:data.years.last,
            m in get_name.(data.timesteps)
        ) +
        sum(
            data.storage_data.f_RS[r, c] * ω_S[s, c, ys] for ys =
                (y+data.years.step):data.years.step:min(
                    y + data.storage_data.L_S[c],
                    data.years.last,
                )
        ) - sum(ω_S[s, r, ys] for ys = (y+data.years.step):data.years.step:data.years.last)
    )

    @mapping(
        model,
        LHS_λ_S[
            s = get_name.(data.storages),
            c = get_name.(data.commodities),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        data.storage_data.Λ_S[s, c, y] +
        sum(
            Δ_S[s, c, ys] for ys =
                max(y - data.storage_data.L_S[c], data.years.start):data.years.step:(y-data.years.step)
        ) +
        sum(
            data.storage_data.f_RS[c_old, c_new] * Δ_RS[s, c_old, c_new, ys] for
            (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies), ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step) if
            (c_new) == c
        ) - sum(
            Δ_RS[s, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies),
            ys = data.years.start:data.years.step:(y-data.years.step) if (c_old) == c
        ) - sum(
            q_S[s, t, c, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        )
    )

    @mapping(
        model,
        LHS_ϕ_S[
            s = get_name.(data.storages),
            t = get_name.(data.traders),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            m = get_name.(data.timesteps),
            y = data.years.range,
        ],
        (1 - data.storage_data.l_S[c, m, data.timestep_mapping.next_step[m]]) * (
            q_S[s, t, c, o, m, y] +
            data.weights[m] * (q_S_in[s, t, c, o, m, y] - q_S_out[s, t, c, o, m, y])
        ) - q_S[s, t, c, o, data.timestep_mapping.next_step[m], y]
    )

    @mapping(
        model,
        LHS_ω_S[
            s = get_name.(data.storages),
            c = get_name.(data.commodities),
            y = data.years.range,
        ],
        data.storage_data.Ω_S[s, c, y] - sum(
            Δ_S[s, c, ys] for ys =
                max(y - data.storage_data.L_S[c], data.years.start):data.years.step:(y-data.years.step)
        ) - sum(
            data.storage_data.f_RS[c_old, c_new] * Δ_RS[s, c_old, c_new, ys] for
            (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies), ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step) if
            (c_new) == c
        ) + sum(
            Δ_RS[s, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies),
            ys = data.years.start:data.years.step:(y-data.years.step) if (c_old) == c
        )
    )

    @mapping(
        model,
        LHS_π_P[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        q_P_to_T[data.nodes[findfirst(x -> x.name == n, data.nodes)].producer, c, o, m, y] -
        q_T_from_P[
            data.nodes[findfirst(x -> x.name == n, data.nodes)].domestic_trader,
            n,
            c,
            o,
            m,
            y,
        ]
    )

    @mapping(
        model,
        LHS_π_T_to_D[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            b in get_name.(data.demand_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        π_T_to_D[n, c, b, m, y] - prices[n, c, b, m, y]
    )

    @mapping(
        model,
        LHS_π_T_to_V[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        sum(
            data.conversion_data.fi_V[c, c_out] * q_V[
                data.nodes[findfirst(x -> x.name == n, data.nodes)].converter,
                t,
                c,
                c_out,
                o,
                m,
                y,
            ] for
            (c_in, c_out) in get_conversion_technology.(data.conversion_technologies) if
            c_in == c
        ) - q_T_to_V[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_π_V_to_T[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        sum(
            q_V[
                data.nodes[findfirst(x -> x.name == n, data.nodes)].converter,
                t,
                c_in,
                c,
                o,
                m,
                y,
            ] for
            (c_in, c_out) in get_conversion_technology.(data.conversion_technologies) if
            c_out == c
        ) - q_T_from_V[t, n, c, o, m, y]
    )

    @mapping(
        model,
        LHS_π_A[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            m in get_name.(data.timesteps),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a, c],
        ],
        q_A[a, c, m, y] - sum(
            q_T[t, a, c, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        )
    )

    @mapping(
        model,
        LHS_π_T_to_S[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        q_T_to_S[t, n, c, o, m, y] -
        q_S_in[data.nodes[findfirst(x -> x.name == n, data.nodes)].storage, t, c, o, m, y]
    )

    @mapping(
        model,
        LHS_π_S_to_T[
            t in get_name.(data.traders),
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        q_S_out[
            data.nodes[findfirst(x -> x.name == n, data.nodes)].storage,
            t,
            c,
            o,
            m,
            y,
        ] - q_T_from_S[t, n, c, o, m, y]
    )

    @_status "Building Model" Progress = "Creating Complementarity Conditions." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile

    @complementarity(model, LHS_q_I, q_I)

    @complementarity(model, LHS_q_P_to_T, q_P_to_T)

    @complementarity(model, LHS_Δ_I, Δ_I)

    @complementarity(model, LHS_Δ_P, Δ_P)

    @complementarity(model, LHS_ϕ_P, ϕ_P)

    @complementarity(model, LHS_λ_I, λ_I)

    @complementarity(model, LHS_λ_P, λ_P)

    @complementarity(model, LHS_ω_P, ω_P)

    @complementarity(model, LHS_ω_I, ω_I)

    @complementarity(model, LHS_q_T_to_D, q_T_to_D)

    @complementarity(model, LHS_q_T_from_P, q_T_from_P)

    @complementarity(model, LHS_q_T_to_V, q_T_to_V)

    @complementarity(model, LHS_q_T_from_V, q_T_from_V)

    @complementarity(model, LHS_q_T_to_S, q_T_to_S)

    @complementarity(model, LHS_q_T_from_S, q_T_from_S)

    @complementarity(model, LHS_q_T, q_T)

    @complementarity(model, LHS_ϕ_T, ϕ_T)

    @complementarity(model, LHS_λ_T, λ_T)

    @complementarity(model, LHS_q_V, q_V)

    @complementarity(model, LHS_Δ_V, Δ_V)

    @complementarity(model, LHS_Δ_RV, Δ_RV)

    @complementarity(model, LHS_λ_V, λ_V)

    @complementarity(model, LHS_q_A, q_A)

    @complementarity(model, LHS_Δ_A, Δ_A)

    @complementarity(model, LHS_Δ_RA, Δ_RA)

    @complementarity(model, LHS_λ_A, λ_A)

    @complementarity(model, LHS_δ_A, δ_A)

    @complementarity(model, LHS_δ_RA, δ_RA)

    @complementarity(model, LHS_q_S, q_S)

    @complementarity(model, LHS_q_S_in, q_S_in)

    @complementarity(model, LHS_q_S_out, q_S_out)

    @complementarity(model, LHS_Δ_S, Δ_S)

    @complementarity(model, LHS_Δ_RS, Δ_RS)

    @complementarity(model, LHS_λ_S, λ_S)

    @complementarity(model, LHS_ϕ_S, ϕ_S)

    @complementarity(model, LHS_ω_S, ω_S)

    @complementarity(model, LHS_π_P, π_P)

    @complementarity(model, LHS_π_T_to_D, π_T_to_D)

    @complementarity(model, LHS_π_T_to_V, π_T_to_V)

    @complementarity(model, LHS_π_V_to_T, π_V_to_T)

    @complementarity(model, LHS_π_A, π_A)

    @complementarity(model, LHS_π_T_to_S, π_T_to_S)

    @complementarity(model, LHS_π_S_to_T, π_S_to_T)

    @_status "Building Model" Progress = "Returning built Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile

    return model
end

"""
    solve_mcp(model::Model; logfile = "", kwargs...)

Solve a JuMP model with complementarity extension using the PATH solver. 

A logfile can be specified, and solver specific options can be passed.

# Examples
```julia-repl
julia> using HydrOGEnMod
julia> data = get_HydrOGEnMod_data("path/to/my/data");
julia> model = build_complementarity_model(data);
julia> solve_mcp(model; output = "no", time_limit = 5);
```
"""
function solve_mcp(model::Model; logfile = "", kwargs...)

    starttime = time()

    @_status "Solving Model" Progress = "Setting Solver Attributes and Solving Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    status = Complementarity.solveMCP(model; kwargs...)

    @_status "Solving Model" Progress = "Solution Status $(status)." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile

    @_status "Solving Model" Progress = "Returning Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    return status
end
