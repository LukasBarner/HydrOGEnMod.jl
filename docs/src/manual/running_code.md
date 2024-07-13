# Running the Model
The mathematical formulation builds upon two possible versions, a convex optimization problem and a mixed complementarity problem implementation. 

When performance matters, it is recommended to utilize the convex optimization problem version, as it is more efficient in terms of both solution procedures, as well as model building and solution retrieval.

## Convex Optimization Problem
The code below depicts an exemplary usage of model code for the convex optimization problem formulation. 
Running the model requires supplying a datafile with the corresponding [Data Specification](@ref).

Note, that in addition to this package, an additional solver is required. Any solver that works with the JuMP package and is suitable to solve convex quadratic programs may be employed. Some open source options include e.g. [HiGHS](https://github.com/jump-dev/HiGHS.jl), [Ipopt](https://github.com/jump-dev/Ipopt.jl) or [OSQP](https://github.com/osqp/OSQP.jl), while [Gurobi](https://github.com/jump-dev/Gurobi.jl) provides a very performant commercial but free to academics option.

```julia
# To use the HydrOGEnMod.jl package: 
using HydrOGEnMod
# In addition, a solver that is capable of solving QPs is needed:
using Ipopt
# To interact with the solved model instance, JuMP is helpful:
using JuMP

# To load the data from the datafile, use the following syntax: 
data = get_HydrOGEnMod_data("path/to/data/file");

# to store the data in a directory to be specified, use the following function:
write_csv("path/to/calculated/parameters",data)

# to build a JuMP Model with the data, use the following function: 
model = build_optimization_model(data)

# to solve the JuMP Model with a solver of your choice, run the following function:
optimize!(model, Ipopt.Optimizer)

# you can also specify different solver options like this: 
options = ("TimeLimit" => 100,"TimeLimit" => 100, "FeasibilityTol" => 1e-6)
optimize!(model, Ipopt.Optimizer, options)

# to write the results to a file, use the following function: 
write_csv("path/to/resultsfile", model)

# you can further interact with the solved model like this: 
prices = value.(model[:prices])

# to plot an overview of the model nodes, use this function: 
plot_model_nodes()

# both arguments nodes_path and disputed_path can be specified to point to your own files:
plot_model_nodes(nodes_path = "path/to/nodes/file", disputed_path = "path/to/disputed/file")

# to plot results (e.g. prices) into the map, use the following function: 
plot_model_nodes(prices[:, "GH2", "Block 1", "OnlySeason", 2020])

# This also works with custom model node files:  
plot_model_nodes(prices[:, "GH2", "Block 1", "OnlySeason", 2020], nodes_path = "path/to/nodes/file", disputed_path = "path/to/disputed/file")

# To all plot_model_nodes, a path where to save the figure can be specified: 
plot_model_nodes(prices[:, "GH2", "Block 1", "OnlySeason", 2020], save_path = "path/to/save/fig.pdf")

# for further examples, please check out the test scripts or the replication section...
```

## Mixed Complementarity Problem
The code below depicts an exemplary usage of model code for the mixed complementarity problem formulation. 

Running the model requires supplying a datafile with the corresponding [Data Specification](@ref).

The implementation in this package makes use of the PATH solver. Note, that despite being available as a dependency, the PATH solver is limited in the number of variables if no license string is provided via the environment variable ```PATH_LICENSE_STRING```. The corresponding environment variable may either be set on the machine, or via ```ENV["PATH_LICENSE_STRING"] = "license_string"``` from within Julia. At the time of writing, an [official license string](https://pages.cs.wisc.edu/~ferris/path/LICENSE) is available from the developers website. 

```julia
# Before using the package, a valid license string to the PATH solver needs to be specified:
ENV["PATH_LICENSE_STRING"] = "Copy_license_string_here"

# To use the HydrOGEnMod.jl package: 
using HydrOGEnMod

# To interact with the solved model instance, JuMP and Complementarity are helpful:
using JuMP, Complementarity

# we can get the data by typing the following line:
# To get a different data file, use the keyword data = /path/to/some/datafile
data = get_HydrOGEnMod_data("path/to/data/file");

# to store the data in a directory to be specified, use the following function:
write_csv("path/to/calculated/parameters",data)

# to build a JuMP Model with the data, use the following function: 
model = build_complementarity_model(data)

# to solve the JuMP Model with a solver of your choice, run the following function:
solve_mcp(model)

# you can also specify different solver options like this: 
options = (output = "no", time_limit = 5)
solve_mcp(model; options)

# to write the results to a file, use the following function: 
write_csv("path/to/resultsfile", model)

# you can further interact with the solved model like this: 
prices = result_value.(model[:π_T_to_D])

# to plot an overview of the model nodes, use this function: 
plot_model_nodes()

# both arguments nodes_path and disputed_path can be specified to point to your own files:
plot_model_nodes(nodes_path = "path/to/nodes/file", disputed_path = "path/to/disputed/file")

# to plot results (e.g. prices) into the map, use the following function: 
plot_model_nodes(prices[:, "GH2", "Block 1", "OnlySeason", 2020])

# This also works with custom model node files:  
plot_model_nodes(prices[:, "GH2", "Block 1", "OnlySeason", 2020], nodes_path = "path/to/nodes/file", disputed_path = "path/to/disputed/file")

# To all plot_model_nodes, a path where to save the figure can be specified: 
plot_model_nodes(prices[:, "GH2", "Block 1", "OnlySeason", 2020], save_path = "path/to/save/fig.pdf")

# for further examples, please check out the test scripts or the replication section...
```

## Custom Modifications
While the model specification allows for quite ambitious analysis, the need to integrate special functionality may emerge. You can interact with the model supplied by ```build_optimization_model(data)``` and ```build_complementarity_model(data)```, just like you would with any normal JuMP/Complementarity model.