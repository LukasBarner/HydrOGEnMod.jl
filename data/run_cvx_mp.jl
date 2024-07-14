using HydrOGEnMod
using Gurobi
using JuMP

mp_results_path = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "results", "cvx_mp")

data_mp =
    get_HydrOGEnMod_data(joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_mp"));
write_csv(joinpath(mp_results_path, "precalculated"), data_mp)

model_mp = build_optimization_model(data_mp)

optimize!(model_mp, Gurobi.Optimizer)
write_csv(mp_results_path, model_mp)
