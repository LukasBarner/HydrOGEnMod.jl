function write(filename, container::JuMP.Containers.DenseAxisArray{Float64}, header)
    if !isempty(container)
        CSV.write(filename, JuMP.Containers.rowtable(container; header = header))
    end
end

function write(filename, container::JuMP.Containers.SparseAxisArray, header)
    if !isempty(container)
        CSV.write(filename, JuMP.Containers.rowtable(container; header = header))
    end
end

"""
    write_csv(datadir, data::ModelData; logfile = "")

Write model data to a specific directory. 

A logfile can be specified.

# Examples
```julia-repl
julia> using HydrOGEnMod
julia> data = get_HydrOGEnMod_data("path/to/my/data");
julia> write_csv("path/to/my/dir",data);
```
"""
function write_csv(datadir, data::ModelData; logfile = "")
    mkpath(datadir)
    write(
        joinpath(datadir, "av_I.csv"),
        data.input_data.av_I,
        [:Producer, :Input, :Block, :Timestep, :Value],
    )
    write(joinpath(datadir, "L_I.csv"), data.input_data.L_I, [:Input, :Value])
    write(
        joinpath(datadir, "c_Pl.csv"),
        data.input_data.c_Pl,
        [:Producer, :Input, :Block, :Timestep, :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Pq.csv"),
        data.input_data.c_Pq,
        [:Producer, :Input, :Block, :Timestep, :Year, :Value],
    )
    write(
        joinpath(datadir, "Ω_I.csv"),
        data.input_data.Ω_I,
        [:Producer, :Input, :Block, :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_I.csv"),
        data.input_data.c_Δ_I,
        [:Producer, :Input, :Block, :Year, :Value],
    )
    write(
        joinpath(datadir, "Λ_I.csv"),
        data.input_data.Λ_I,
        [:Producer, :Input, :Timestep, :Year, :Value],
    )

    write(
        joinpath(datadir, "Λ_P.csv"),
        data.production_data.Λ_P,
        [:Producer, Symbol("Flow Commodity"), :Origin, :Year, :Value],
    )
    write(
        joinpath(datadir, "c_P.csv"),
        data.production_data.c_P,
        [:Producer, Symbol("Flow Commodity"), :Origin, :Year, :Value],
    )
    write(
        joinpath(datadir, "Ω_P.csv"),
        data.production_data.Ω_P,
        [:Producer, Symbol("Flow Commodity"), :Origin, :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_P.csv"),
        data.production_data.c_Δ_P,
        [:Producer, Symbol("Flow Commodity"), :Origin, :Year, :Value],
    )
    write(
        joinpath(datadir, "L_P.csv"),
        data.production_data.L_P,
        [Symbol("Flow Commodity"), :Origin, :Value],
    )
    write(
        joinpath(datadir, "fi_P.csv"),
        data.production_data.fi_P,
        [Symbol("Flow Commodity"), :Input, :Origin, :Value],
    )

    write(
        joinpath(datadir, "Λ_T.csv"),
        data.trade_data.Λ_T,
        [:Trader, :Node, :Commodity, :Origin, :Year, :Value],
    )
    write(
        joinpath(datadir, "NC.csv"),
        data.trade_data.NC,
        [:Trader, :Node, :Commodity, :Value],
    )

    write(
        joinpath(datadir, "Λ_V.csv"),
        data.conversion_data.Λ_V,
        [:Converter, Symbol("Input Commodity"), Symbol("Output Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_V.csv"),
        data.conversion_data.c_V,
        [:Converter, Symbol("Input Commodity"), Symbol("Output Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_V.csv"),
        data.conversion_data.c_Δ_V,
        [:Converter, Symbol("Input Commodity"), Symbol("Output Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_RV.csv"),
        data.conversion_data.c_Δ_RV,
        [
            :Converter,
            Symbol("Old Input Commodity"),
            Symbol("Old Output Commodity"),
            Symbol("New Input Commodity"),
            Symbol("New Output Commodity"),
            :Year,
            :Value,
        ],
    )
    write(
        joinpath(datadir, "L_V.csv"),
        data.conversion_data.L_V,
        [Symbol("Input Commodity"), Symbol("Output Commodity"), :Value],
    )
    write(
        joinpath(datadir, "fi_V.csv"),
        data.conversion_data.fi_V,
        [Symbol("Input Commodity"), Symbol("Output Commodity"), :Value],
    )

    write(
        joinpath(datadir, "c_A.csv"),
        data.arc_data.c_A,
        [:Arc, Symbol("Flow Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_A.csv"),
        data.arc_data.c_Δ_A,
        [:Arc, Symbol("Flow Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_RA.csv"),
        data.arc_data.c_Δ_RA,
        [:Arc, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "Λ_A.csv"),
        data.arc_data.Λ_A,
        [:Arc, Symbol("Flow Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "l_a_loss.csv"),
        data.arc_data.l_a,
        [:Arc, Symbol("Flow Commodity"), :Value],
    )
    write(
        joinpath(datadir, "L_A_life.csv"),
        data.arc_data.L_A,
        [Symbol("Flow Commodity"), :Value],
    )

    write(
        joinpath(datadir, "Λ_S.csv"),
        data.storage_data.Λ_S,
        [:Storage, Symbol("Flow Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_S_in.csv"),
        data.storage_data.c_S_in,
        [:Storage, Symbol("Flow Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_S_out.csv"),
        data.storage_data.c_S_out,
        [:Storage, Symbol("Flow Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_S.csv"),
        data.storage_data.c_Δ_S,
        [:Storage, Symbol("Flow Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "c_Δ_RS.csv"),
        data.storage_data.c_Δ_RS,
        [:Storage, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
    )
    write(
        joinpath(datadir, "l_s_loss.csv"),
        data.storage_data.l_S,
        [
            Symbol("Flow Commodity"),
            Symbol("Injection Season"),
            Symbol("Extraction Season"),
            :Value,
        ],
    )
    write(
        joinpath(datadir, "L_S_life.csv"),
        data.storage_data.L_S,
        [Symbol("Flow Commodity"), :Value],
    )
    write(
        joinpath(datadir, "Ω_S.csv"),
        data.storage_data.Ω_S,
        [:Storage, Symbol("Flow Commodity"), :Year, :Value],
    )

    write(
        joinpath(datadir, "α_D.csv"),
        data.demand_data.α_D,
        [:Node, :Commodity, :Block, :Timestep, :Year, :Value],
    )
    write(
        joinpath(datadir, "β_D.csv"),
        data.demand_data.β_D,
        [:Node, :Commodity, :Block, :Timestep, :Year, :Value],
    )
end

"""
    write_csv(resultsfile, model::Model; logfile = "")

Write model results to a specific directory. 

A logfile can be specified.

# Examples
```julia-repl
julia> data = get_HydrOGEnMod_data("path/to/my/data");
julia> model = build_optimization_model(data);
julia> optimize!(model, Ipopt.Optimizer);
julia> write_csv("path/to/my/dir", model);
```
"""
function write_csv(resultsfile, model::Model; logfile = "")
    mkpath(joinpath(resultsfile, "variables"))
    mkpath(joinpath(resultsfile, "expressions"))
    starttime = time()

    if haskey(model.ext, :MCP)

        @_status "Writing Results" Progress = "Writing q_I." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_I.csv"),
            result_value.(model[:q_I]),
            [:Producer, :Input, :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_P_to_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_P_to_T.csv"),
            result_value.(model[:q_P_to_T]),
            [:Producer, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_I." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_I.csv"),
            result_value.(model[:Δ_I]),
            [:Producer, :Input, :Block, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_P." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_P.csv"),
            result_value.(model[:Δ_P]),
            [:Producer, :Commodity, :Origin, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing ϕ_P." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "ϕ_P.csv"),
            result_value.(model[:ϕ_P]),
            [:Producer, :Input, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing λ_I." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "λ_I.csv"),
            result_value.(model[:λ_I]),
            [:Producer, :Input, :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing λ_P." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "λ_P.csv"),
            result_value.(model[:λ_P]),
            [:Producer, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing ω_P." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "ω_P.csv"),
            result_value.(model[:ω_P]),
            [:Producer, :Commodity, :Origin, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing ω_I." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "ω_I.csv"),
            result_value.(model[:ω_I]),
            [:Producer, :Input, :Block, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T_to_D." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T_to_D.csv"),
            result_value.(model[:q_T_to_D]),
            [:Trader, :Node, :Commodity, :Block, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T_from_P." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T_from_P.csv"),
            result_value.(model[:q_T_from_P]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T_to_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T_to_V.csv"),
            result_value.(model[:q_T_to_V]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T_from_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T_from_V.csv"),
            result_value.(model[:q_T_from_V]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T_to_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T_to_S.csv"),
            result_value.(model[:q_T_to_S]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T_from_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T_from_S.csv"),
            result_value.(model[:q_T_from_S]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T.csv"),
            result_value.(model[:q_T]),
            [:Trader, :Arc, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing ϕ_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "ϕ_T.csv"),
            result_value.(model[:ϕ_T]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing λ_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "λ_T.csv"),
            result_value.(model[:λ_T]),
            [:Trader, :Node, :Commodity, :Origin, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_V.csv"),
            result_value.(model[:q_V]),
            [:Converter, :Trader, :Input, :Output, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_V.csv"),
            result_value.(model[:Δ_V]),
            [:Converter, :Input, :Output, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_RV." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_RV.csv"),
            result_value.(model[:Δ_RV]),
            [
                :Converter,
                Symbol("Old Input"),
                Symbol("Old Output"),
                Symbol("New Input"),
                Symbol("New Output"),
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing λ_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "λ_V.csv"),
            result_value.(model[:λ_V]),
            [:Converter, :Input, :Output, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_A." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_A.csv"),
            result_value.(model[:q_A]),
            [:Arc, :Commodity, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_A." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_A.csv"),
            result_value.(model[:Δ_A]),
            [:Arc, :Commodity, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_RA." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_RA.csv"),
            result_value.(model[:Δ_RA]),
            [:Arc, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing λ_A." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "λ_A.csv"),
            result_value.(model[:λ_A]),
            [:Arc, :Commodity, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing δ_A." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "δ_A.csv"),
            result_value.(model[:δ_A]),
            [:Arc, :Commodity, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing δ_RA." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "δ_RA.csv"),
            result_value.(model[:δ_RA]),
            [:Arc, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_S.csv"),
            result_value.(model[:q_S]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_S_in." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_S_in.csv"),
            result_value.(model[:q_S_in]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_S_out." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_S_out.csv"),
            result_value.(model[:q_S_out]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_S.csv"),
            result_value.(model[:Δ_S]),
            [:Storage, :Commodity, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_RS." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_RS.csv"),
            result_value.(model[:Δ_RS]),
            [:Storage, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing λ_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "λ_S.csv"),
            result_value.(model[:λ_S]),
            [:Storage, :Commodity, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing ϕ_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "ϕ_S.csv"),
            result_value.(model[:ϕ_S]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing ω_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "ω_S.csv"),
            result_value.(model[:ω_S]),
            [:Storage, :Commodity, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing π_P." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "π_P.csv"),
            result_value.(model[:π_P]),
            [:Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing π_T_to_D." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "π_T_to_D.csv"),
            result_value.(model[:π_T_to_D]),
            [:Node, :Commodity, :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing π_T_to_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "π_T_to_V.csv"),
            result_value.(model[:π_T_to_V]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing π_V_to_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "π_V_to_T.csv"),
            result_value.(model[:π_V_to_T]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing π_A." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "π_A.csv"),
            result_value.(model[:π_A]),
            [:Arc, :Commodity, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing π_T_to_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "π_T_to_S.csv"),
            result_value.(model[:π_T_to_S]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing π_S_to_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "π_S_to_T.csv"),
            result_value.(model[:π_S_to_T]),
            [:Trader, :Node, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

    else
        @_status "Writing Results" Progress = "Writing Δ_I." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_I.csv"),
            value.(model[:Δ_I]),
            [:Producer, :Input, :Block, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_I." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_I.csv"),
            value.(model[:q_I]),
            [:Producer, :Input, :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_P_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_P_T.csv"),
            value.(model[:q_P_T]),
            [:Producer, :Commodity, :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_P." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_P.csv"),
            value.(model[:Δ_P]),
            [:Producer, Symbol("Flow Commodity"), :Origin, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_T_D." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T_D.csv"),
            value.(model[:q_T_D]),
            [
                :Trader,
                :Node,
                Symbol("Flow Commodity"),
                :Block,
                :Origin,
                :Timestep,
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing q_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_V.csv"),
            value.(model[:q_V]),
            [
                :Converter,
                :Trader,
                Symbol("Flow Commodity"),
                Symbol("Demand Commodity"),
                :Origin,
                :Timestep,
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing Δ_V." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_V.csv"),
            value.(model[:Δ_V]),
            [
                :Converter,
                Symbol("Flow Commodity"),
                Symbol("Demand Commodity"),
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing Δ_RV." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_RV.csv"),
            value.(model[:Δ_RV]),
            [
                :Converter,
                Symbol("Old Input Commodity"),
                Symbol("Old Output Commodity"),
                Symbol("New Input Commodity"),
                Symbol("New Output Commodity"),
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing q_T." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_T.csv"),
            value.(model[:q_T]),
            [:Trader, :Arc, Symbol("Flow Commodity"), :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_A." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_A.csv"),
            value.(model[:Δ_A]),
            [:Arc, Symbol("Flow Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_RA." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_RA.csv"),
            value.(model[:Δ_RA]),
            [:Arc, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_S.csv"),
            value.(model[:q_S]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_S_in." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_S_in.csv"),
            value.(model[:q_S_in]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing q_S_out." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "q_S_out.csv"),
            value.(model[:q_S_out]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_S." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_S.csv"),
            value.(model[:Δ_S]),
            [:Storage, Symbol("Flow Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing Δ_RS." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "variables", "Δ_RS.csv"),
            value.(model[:Δ_RS]),
            [:Storage, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing gross_surplus." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "gross_surplus.csv"),
            value.(model[:gross_surplus]),
            [:Node, Symbol("Demand Commodity"), :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing market_power_adjustment." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "market_power_adjustment.csv"),
            value.(model[:market_power_adjustment]),
            [:Node, Symbol("Demand Commodity"), :Block, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing prices." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "prices.csv"),
            value.(model[:prices]),
            [:Node, Symbol("Demand Commodity"), :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing demand." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "demand.csv"),
            value.(model[:demand]),
            [:Node, Symbol("Demand Commodity"), :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing yearly demand." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "yearly_demand.csv"),
            value.(model[:yearly_demand]),
            [:Node, Symbol("Demand Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing yearly production." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "yearly_production.csv"),
            value.(model[:yearly_production]),
            [:Producer, Symbol("Demand Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing input_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "input_cost.csv"),
            value.(model[:input_cost]),
            [:Producer, :Input, :Block, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing yearly_input_procurement." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "yearly_input_procurement.csv"),
            value.(model[:yearly_input_procurement]),
            [:Producer, :Input, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing input_expansion_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "input_expansion_cost.csv"),
            value.(model[:input_expansion_cost]),
            [:Producer, :Input, :Block, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing production_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "production_cost.csv"),
            value.(model[:production_cost]),
            [:Producer, Symbol("Flow Commodity"), :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing production_expansion_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "production_expansion_cost.csv"),
            value.(model[:production_expansion_cost]),
            [:Producer, Symbol("Flow Commodity"), :Origin, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing conversion_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "conversion_cost.csv"),
            value.(model[:conversion_cost]),
            [
                :Converter,
                :Trader,
                Symbol("Flow Commodity"),
                Symbol("Demand Commodity"),
                :Origin,
                :Timestep,
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing conversion_expansion_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "conversion_expansion_cost.csv"),
            value.(model[:conversion_expansion_cost]),
            [
                :Converter,
                Symbol("Flow Commodity"),
                Symbol("Demand Commodity"),
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing conversion_repurposing_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "conversion_repurposing_cost.csv"),
            value.(model[:conversion_repurposing_cost]),
            [
                :Converter,
                Symbol("Old Input Commodity"),
                Symbol("Old Output Commodity"),
                Symbol("New Input Commodity"),
                Symbol("New Output Commodity"),
                :Year,
                :Value,
            ],
        )

        @_status "Writing Results" Progress = "Writing transport_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "transport_cost.csv"),
            value.(model[:transport_cost]),
            [:Trader, :Arc, Symbol("Flow Commodity"), :Origin, :Timestep, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing transport_expansion_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "transport_expansion_cost.csv"),
            value.(model[:transport_expansion_cost]),
            [:Arc, Symbol("Flow Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing transport_repurposing_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "transport_repurposing_cost.csv"),
            value.(model[:transport_repurposing_cost]),
            [:Arc, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing yearly_arc_flows." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "yearly_arc_flows.csv"),
            value.(model[:yearly_arc_flows]),
            [:Arc, :Commodity, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing storage_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "storage_cost.csv"),
            value.(model[:storage_cost]),
            [:Storage, :Trader, :Commodity, :Origin, :Season, :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing storage_expansion_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "storage_expansion_cost.csv"),
            value.(model[:storage_expansion_cost]),
            [:Storage, Symbol("Flow Commodity"), :Year, :Value],
        )

        @_status "Writing Results" Progress = "Writing storage_repurposing_cost." "Time elapsed" =
            temporal(time() - starttime) logfile = logfile
        write(
            joinpath(resultsfile, "expressions", "storage_repurposing_cost.csv"),
            value.(model[:storage_repurposing_cost]),
            [:Storage, Symbol("Old Commodity"), Symbol("New Commodity"), :Year, :Value],
        )
    end
    @_status "Writing Results" Progress = "Finished Writing." "Time elapsed" =
        temporal(time() - starttime) logfile = logfile
end
