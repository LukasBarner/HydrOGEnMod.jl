using HydrOGEnMod
using Gurobi
using JuMP

data_mp =
    get_HydrOGEnMod_data(joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_mp"));

model_mp = build_optimization_model(data_mp)

optimize!(model_mp, Gurobi.Optimizer)