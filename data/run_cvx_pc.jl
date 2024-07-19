using HydrOGEnMod
using Gurobi
using JuMP

data_pc =
    get_HydrOGEnMod_data(joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_pc"));

model_pc = build_optimization_model(data_pc)

optimize!(model_pc, Gurobi.Optimizer)