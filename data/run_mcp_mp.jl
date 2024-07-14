using HydrOGEnMod
using JuMP, Complementarity

# Before using the package, a valid license string to the PATH solver needs to be specified. 
# An official license string is available from https://pages.cs.wisc.edu/~ferris/path/LICENSE
ENV["PATH_LICENSE_STRING"] = "Copy_license_string_here"

mp_results_path = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "results", "mcp_mp")

data_mp =
    get_HydrOGEnMod_data(joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_mp"));
write_csv(joinpath(mp_results_path, "precalculated"), data_mp)

model_mp = build_complementarity_model(data_mp)

options = (output = "yes", time_limit = 18000)
solve_mcp(model_mp; options)
write_csv(mp_results_path, model_mp)
