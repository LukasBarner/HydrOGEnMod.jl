using HydrOGEnMod
using JuMP, Complementarity

# Before using the package, a valid license string to the PATH solver needs to be specified. 
# An official license string is available from https://pages.cs.wisc.edu/~ferris/path/LICENSE
# ENV["PATH_LICENSE_STRING"] = "Copy_license_string_here"

data_pc =
    get_HydrOGEnMod_data(joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_pc"));

model_pc = build_complementarity_model(data_pc)

options = (output = "yes", time_limit = 36000, cumulative_iteration_limit = 100000)
solve_mcp(model_pc; options...)