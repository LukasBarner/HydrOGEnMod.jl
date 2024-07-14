using HydrOGEnMod
using JuMP, Complementarity

# Before using the package, a valid license string to the PATH solver needs to be specified. 
# An official license string is available from https://pages.cs.wisc.edu/~ferris/path/LICENSE
ENV["PATH_LICENSE_STRING"] = "Copy_license_string_here"

pc_results_path = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "results", "mcp_pc")

data_pc =
    get_HydrOGEnMod_data(joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_pc"));
write_csv(joinpath(pc_results_path, "precalculated"), data_pc)

model_pc = build_complementarity_model(data_pc)

options = (output = "yes", time_limit = 18000)
solve_mcp(model_pc; options)
write_csv(pc_results_path, model_pc)
