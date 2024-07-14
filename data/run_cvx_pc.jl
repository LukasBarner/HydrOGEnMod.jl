using HydrOGEnMod
using Gurobi
using JuMP

pc_results_path = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "results", "cvx_pc")

data_pc =
    get_HydrOGEnMod_data(joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_pc"));
write_csv(joinpath(pc_results_path, "precalculated"), data_pc)

model_pc = build_optimization_model(data_pc)

optimize!(model_pc, Gurobi.Optimizer)
write_csv(pc_results_path, model_pc)
