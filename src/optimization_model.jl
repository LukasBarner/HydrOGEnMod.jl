"""
    build_optimization_model(data::ModelData, BIG = 1e+6, logfile = "")

Build a JuMP optimization model (QP) from the underlying model data. 

A logfile and upper bounds on variables can be specified. 

# Examples
```julia-repl
julia> using HydrOGEnMod
julia> data = get_HydrOGEnMod_data("path/to/my/data");
julia> model = build_optimization_model(data);
```
"""
function build_optimization_model(data::ModelData, BIG = 1e+6, logfile = "")

    starttime = time()

    @_status "Building Model" Progress = "Creating Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    model = Model()

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
        q_P_T[
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
        q_T_D[
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
        q_T[
            t = get_name.(data.traders),
            a = get_name.(data.arcs),
            c = get_name.(data.commodities),
            o = get_name.(data.origins),
            s = get_name.(data.timesteps),
            y = data.years.range;
            data.arc_adjacency.is_a_of_c[a,c]
        ] <=
        BIG
    )

    @variable(
        model,
        0 <= Δ_A[a = get_name.(data.arcs), c = get_name.(data.commodities), y = data.years.range;
        data.arc_adjacency.is_a_of_c[a,c]] <= BIG
    )

    @variable(
        model,
        0 <=
        Δ_RA[
            a = get_name.(data.arcs),
            c_old = get_from_throughput.(data.repurposing_arc_technologies),
            c_new = get_to_throughput.(data.repurposing_arc_technologies),
            y = data.years.range; 
            data.arc_adjacency.is_a_of_c[a,c_old]
        ] <=
        BIG
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
            q_T_D[t, n, c, b, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        )
    )

    @_status "Building Model" Progress = "Creating Yearly Demand Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        yearly_demand[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            y in data.years.range,
        ],
        sum(
            data.days[m] * q_T_D[t, n, c, b, o, m, y] for o in get_name.(data.origins),
            b in get_name.(data.demand_blocks), m in get_name.(data.timesteps),
            t in get_name.(data.traders)
        )
    )

    @_status "Building Model" Progress = "Creating Yearly Production Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        yearly_production[
            p in get_name.(data.producers),
            c in get_name.(data.commodities),
            y in data.years.range,
        ],
        sum(
            data.days[m] * q_P_T[p, c, o, m, y] for
            o in get_name.(data.origins), m in get_name.(data.timesteps) if
            (c, o) in get_production_technology.(data.production_technologies)
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
        data.days[m] / 2 * data.demand_data.β_D[n, c, b, m, y] * (demand[n, c, b, m, y])^2 +
        data.days[m] * data.demand_data.α_D[n, c, b, m, y] * demand[n, c, b, m, y]
    )

    @_status "Building Model" Progress = "Creating Market Power Adjustment Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        market_power_adjustment[
            n in get_name.(data.nodes),
            c in get_name.(data.commodities),
            b in get_name.(data.demand_blocks),
            y in data.years.range,
        ],
        0.5 * sum(
            data.days[m] *
            data.trade_data.NC[t, n, c] *
            data.demand_data.β_D[n, c, b, m, y] *
            sum(q_T_D[t, n, c, b, o, m, y] for o in get_name.(data.origins))^2 for
            t in get_name.(data.traders), m in get_name.(data.timesteps)
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
        data.days[m] * (
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
        sum(data.days[m] * q_I[p, i, b, m, y] for b in get_name.(data.input_operational_blocks), m in get_name.(data.timesteps))
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
        data.days[m] * data.production_data.c_P[p, c, o, y] * q_P_T[p, c, o, m, y]
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
        data.days[m] *
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
            data.arc_adjacency.is_a_of_c[a,c]
        ],
        data.days[m] * data.arc_data.c_A[a, c, y] * q_T[t, a, c, o, m, y]
    )

    @_status "Building Model" Progress = "Creating Transport Capacity Expansion Cost Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(
        model,
        transport_expansion_cost[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a,c]
        ],
        0.5 * data.arc_data.c_Δ_A[a, c, y] / data.years.step * Δ_A[a, c, y]
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
            ((c_old, c_new) in
            get_repurposing_technology.(data.repurposing_arc_technologies)) 
            && (data.arc_adjacency.is_a_of_c[a,c_old])
        ],
        0.5 * data.arc_data.c_Δ_RA[a, c_old, c_new, y] / data.years.step *
        Δ_RA[a, c_old, c_new, y]
    )

    @_status "Building Model" Progress = "Creating Aggregated Arc Flow Expression." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @expression(model, yearly_arc_flows[a in get_name.(data.arcs), c in get_name.(data.commodities), y in data.years.range], sum(data.days[m] * q_T[t, a, c, o, m, y] for t in get_name.(data.traders), o in get_name.(data.origins), m in get_name.(data.timesteps) if data.arc_adjacency.is_a_of_c[a,c] ));

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
        data.days[m] * data.storage_data.c_S_in[s, c, y] * q_S_in[s, t, c, o, m, y] +
        data.days[m] * data.storage_data.c_S_out[s, c, y] * q_S_out[s, t, c, o, m, y]
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

    @_status "Building Model" Progress = "Creating Objective from Expressions." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @objective(
        model,
        Max,
        sum(
            data.discount[y] * gross_surplus[n, c, b, m, y] for
            (n, c, b, m, y) in all_indices(gross_surplus)
        ) + sum(
            data.discount[y] * market_power_adjustment[n, c, b, y] for
            (n, c, b, y) in all_indices(market_power_adjustment)
        ) - sum(
            data.discount[y] * input_cost[p, i, b, m, y] for
            (p, i, b, m, y) in all_indices(input_cost)
        ) - sum(
            data.discount[y] * input_expansion_cost[p, i, b, y] for
            (p, i, b, y) in all_indices(input_expansion_cost)
        ) - sum(
            data.discount[y] * production_cost[p, c, o, m, y] for
            (p, c, o, m, y) in all_indices(production_cost)
        ) - sum(
            data.discount[y] * production_expansion_cost[p, c, o, y] for
            (p, c, o, y) in all_indices(production_expansion_cost)
        ) - sum(
            data.discount[y] * conversion_cost[v, t, c_i, c_o, o, m, y] for
            (v, t, c_i, c_o, o, m, y) in all_indices(conversion_cost)
        ) - sum(
            data.discount[y] * conversion_expansion_cost[v, c_i, c_o, y] for
            (v, c_i, c_o, y) in all_indices(conversion_expansion_cost)
        ) - sum(
            data.discount[y] *
            conversion_repurposing_cost[v, c_in_old, c_out_old, c_in_new, c_out_new, y] for
            (v, c_in_old, c_out_old, c_in_new, c_out_new, y) in
            all_indices(conversion_repurposing_cost)
        ) - sum(
            data.discount[y] * transport_cost[t, a, c, o, m, y] for
            (t, a, c, o, m, y) in all_indices(transport_cost)
        ) - sum(
            data.discount[y] * transport_expansion_cost[a, c, y] for
            (a, c, y) in all_indices(transport_expansion_cost)
        ) - sum(
            data.discount[y] * transport_repurposing_cost[a, c_old, c_new, y] for
            (a, c_old, c_new, y) in all_indices(transport_repurposing_cost)
        ) - sum(
            data.discount[y] * storage_cost[s, t, c, o, m, y] for
            (s, t, c, o, m, y) in all_indices(storage_cost)
        ) - sum(
            data.discount[y] * storage_expansion_cost[s, c, y] for
            (s, c, y) in all_indices(storage_expansion_cost)
        ) - sum(
            data.discount[y] * storage_repurposing_cost[s, r, c, y] for
            (s, r, c, y) in all_indices(storage_repurposing_cost)
        )
    )


    @_status "Building Model" Progress = "Creating Producer Mass Balance Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        producer_mass_balance[
            p in get_name.(data.producers),
            i in get_name.(data.inputs),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        sum(
            data.production_data.fi_P[c, i, o] * q_P_T[p, c, o, m, y] for
            o in get_name.(data.origins), c in get_name.(data.commodities) if
            (c, o) in get_production_technology.(data.production_technologies)
        ) <= sum(q_I[p, i, b, m, y] for b in get_name.(data.input_operational_blocks))
    )

    @_status "Building Model" Progress = "Creating Producer Input Limit Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        input_block_limit[
            p in get_name.(data.producers),
            i in get_name.(data.inputs),
            b in get_name.(data.input_operational_blocks),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        q_I[p, i, b, m, y] <=
        data.input_data.av_I[p, i, b, m] * (
            data.input_data.Λ_I[p, i, b, y] + sum(
                Δ_I[p, i, b, ys] for ys =
                    max(y - data.input_data.L_I[i], data.years.start):data.years.step:(y-data.years.step)
            )
        )
    )

    @_status "Building Model" Progress = "Creating Production Capacity Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        production_capacity[
            p in get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        q_P_T[p, c, o, m, y] <=
        data.production_data.Λ_P[p, c, o, y] + sum(
            Δ_P[p, c, o, ys] for ys =
                max(y - data.production_data.L_P[c, o], data.years.start):data.years.step:(y-data.years.step)
        )
    )

    @_status "Building Model" Progress = "Creating Production Capacity Expansion Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        production_expansion_limit[
            p in get_name.(data.producers),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            y in data.years.range;
            (c, o) in get_production_technology.(data.production_technologies),
        ],
        Δ_P[p, c, o, y] <= data.production_data.Ω_P[p, c, o, y]
    )

    @_status "Building Model" Progress = "Creating Input Capacity Expansion Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        input_expansion_limit[
            p in get_name.(data.producers),
            i in get_name.(data.inputs),
            b in get_name.(data.input_operational_blocks),
            y in data.years.range,
        ],
        sum(
            Δ_I[p, i, b, ys] for ys =
                max(y - data.input_data.L_I[i], data.years.start):data.years.step:(y-data.years.step)
        ) <= data.input_data.Ω_I[p, i, b, y]
    )

    @_status "Building Model" Progress = "Creating Trader Mass Balance Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        trader_mass_balance[
            t in data.traders,
            n in data.nodes,
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        sum(
            (1 + data.arc_data.l_a[a, c]) * q_T[get_name(t), a, c, o, m, y] for
            a in n.starting_arcs if data.arc_adjacency.is_a_of_c[a,c]
        ) +
        sum(
            q_T_D[get_name(t), get_name(n), c, b, o, m, y] for
            b in get_name.(data.demand_blocks)
        ) +
        sum(
            data.conversion_data.fi_V[c, c_n] *
            q_V[n.converter, get_name(t), c_o, c_n, o, m, y] for
            (c_o, c_n) in get_conversion_technology.(data.conversion_technologies) if
            c_o == c
        ) +
        q_S_in[n.storage, get_name(t), c, o, m, y] ==
        sum(q_T[get_name(t), a, c, o, m, y] for a in n.ending_arcs if data.arc_adjacency.is_a_of_c[a,c]) +
        sum(
            q_V[n.converter, get_name(t), c_o, c_n, o, m, y] for
            (c_o, c_n) in get_conversion_technology.(data.conversion_technologies) if
            c_n == c
        ) +
        sum(
            q_P_T[p, c, o, m, y] for p in [n.producer] if n.producer in t.producers &&
            (c, o) in get_production_technology.(data.production_technologies)
        ) +
        q_S_out[n.storage, get_name(t), c, o, m, y]
    )

    @_status "Building Model" Progress = "Creating Trade Sanction Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        trade_sanctions[(t, n, c, o, y) in all_indices(data.trade_data.Λ_T)],
        sum(
            data.days[m] *
            sum(q_T_D[t, n, c, b, o, m, y] for b in get_name.(data.demand_blocks)) for
            m in get_name.(data.timesteps)
        ) <= data.trade_data.Λ_T[t, n, c, o, y]
    )

    @_status "Building Model" Progress = "Creating Conversion Capacity Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        conversion_capacity[
            v in get_name.(data.converters),
            c_i = unique(get_input.(data.conversion_technologies)),
            c_o = unique(get_output.(data.conversion_technologies)),
            m in get_name.(data.timesteps),
            y in data.years.range;
            (c_i, c_o) ∈ get_conversion_technology.(data.conversion_technologies),
        ],
        sum(
            q_V[v, t, c_i, c_o, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        ) <=
        data.conversion_data.Λ_V[v, c_i, c_o, y] +
        sum(
            Δ_V[v, c_i, c_o, ys] for ys =
                max(y - data.conversion_data.L_V[c_i, c_o], data.years.start):data.years.step:(y-data.years.step)
        ) +
        sum( data.conversion_data.f_RV[c_in_old, c_out_old, c_in_new, c_out_new] *
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
        )
    )

    @_status "Building Model" Progress = "Creating Arc Capacity Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        arc_capacity[
            a in get_name.(data.arcs),
            c in get_name.(data.commodities),
            m in get_name.(data.timesteps),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[a,c]
        ],
        sum(
            q_T[t, a, c, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        ) <=
        data.arc_data.Λ_A[a, c, y] +
        sum(
            Δ_A[a, c, ys] for ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step)
        ) +
        sum( data.arc_data.f_RA[c_old, c_new] * 
            Δ_RA[a, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_arc_technologies), ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step) if
            (c_new) == c
        ) - sum(
            Δ_RA[a, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_arc_technologies),
            ys = data.years.start:data.years.step:(y-data.years.step) if (c_old) == c
        )
    )

    @_status "Building Model" Progress = "Creating Equal Arc Capacity Expansion." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        equal_arc_expansion[
            a in data.arcs,
            c in get_name.(data.commodities),
            y in data.years.range;
            data.arc_adjacency.is_a_of_c[get_name(a),c]
        ],
        Δ_A[get_name(a), c, y] == Δ_A[a.inverse_arc, c, y]
    )

    @_status "Building Model" Progress = "Creating Equal Arc Capacity Repurposing." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        equal_arc_repurposing[
            a in data.arcs,
            c_old in get_name.(data.commodities),
            c_new in get_name.(data.commodities),
            y in data.years.range;
            ((c_old, c_new) in
            get_repurposing_technology.(data.repurposing_arc_technologies)) 
            && (data.arc_adjacency.is_a_of_c[get_name(a),c_old])
        ],
        Δ_RA[get_name(a), c_old, c_new, y] == Δ_RA[a.inverse_arc, c_old, c_new, y]
    )

    @_status "Building Model" Progress = "Creating Storage Capacity Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        storage_capacities[
            s in get_name.(data.storages),
            c in get_name.(data.commodities),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        sum(
            q_S[s, t, c, o, m, y] for o in get_name.(data.origins),
            t in get_name.(data.traders)
        ) <=
        data.storage_data.Λ_S[s, c, y] +
        sum(
            Δ_S[s, c, ys] for ys =
                max(y - data.storage_data.L_S[c], data.years.start):data.years.step:(y-data.years.step)
        ) +
        sum( data.storage_data.f_RS[c_old, c_new] * 
            Δ_RS[s, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies), ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step) if
            (c_new) == c
        ) - sum(
            Δ_RS[s, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies),
            ys = data.years.start:data.years.step:(y-data.years.step) if (c_old) == c
        )
    )

    @_status "Building Model" Progress = "Creating Storage Mass Balance Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        storage_mass_balance[
            s in get_name.(data.storages),
            t in get_name.(data.traders),
            c in get_name.(data.commodities),
            o in get_name.(data.origins),
            m in get_name.(data.timesteps),
            y in data.years.range,
        ],
        q_S[s, t, c, o, data.timestep_mapping.next_step[m], y] ==
        (1 - data.storage_data.l_S[c, m, data.timestep_mapping.next_step[m]]) * (
            q_S[s, t, c, o, m, y] +
            data.days[m] * (q_S_in[s, t, c, o, m, y] - q_S_out[s, t, c, o, m, y])
        )
    )

    @_status "Building Model" Progress = "Creating Storage Expansion Constraints." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    @constraint(
        model,
        storage_expansion_limit[
            s in get_name.(data.storages),
            c in get_name.(data.commodities),
            y in data.years.range,
        ],
        sum(
            Δ_S[s, c, ys] for ys =
                max(y - data.storage_data.L_S[c], data.years.start):data.years.step:(y-data.years.step)
        ) + sum(
            Δ_RS[s, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies), ys =
                max(y - data.arc_data.L_A[c], data.years.start):data.years.step:(y-data.years.step) if
            (c_new) == c
        ) - sum(
            Δ_RS[s, c_old, c_new, ys] for (c_old, c_new) in
            get_repurposing_technology.(data.repurposing_storage_technologies),
            ys = data.years.start:data.years.step:(y-data.years.step) if (c_old) == c
        ) <= data.storage_data.Ω_S[s, c, y]
    )

    @_status "Building Model" Progress = "Returning built Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile

    return model
end

"""
    optimize!(model::Model, optimizer; options..., logfile = "")

Solve a JuMP Model with the given optimizer. 

A logfile can be specified, and solver specific options can be passed. 

# Examples
```julia-repl
julia> using HydrOGEnMod
julia> using Ipopt
julia> data = get_HydrOGEnMod_data("path/to/my/data");
julia> model = build_optimization_model(data);
julia> optimize!(model, Ipopt.Optimizer, "max_wall_time" => 1e-5)
```
"""
function JuMP.optimize!(model::Model, optimizer, options...; logfile = "")

    starttime = time()

    @_status "Optimizing Model" Progress = "Setting Optimizer." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    set_optimizer(model, optimizer)

    @_status "Optimizing Model" Progress = "Setting Optimizer Attributes." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    set_optimizer_attributes(model, options...)

    @_status "Optimizing Model" Progress = "Solving Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    JuMP.optimize!(model)

    @_status "Optimizing Model" Progress = "Solution Status $(termination_status(model))." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile

    @_status "Optimizing Model" Progress = "Returning Model." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
    return model

end
