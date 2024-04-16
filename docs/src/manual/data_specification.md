# Data Specification
This section explains the structure in which data sets must be supplied in order for HydrOGEnMod.jl to generate the underlying model data. In total, there must exist 8 subfolders that each contain several data sheets on specific parts of the hydrogen value chain in the form of csv files. 

Any provided dataset must be structured in the following way: 
```
datafile
├── conversion
│   ├── Capacities.csv
│   ├── Conversion_Data.csv
│   └── Repurposing.csv
├── demand
│   └── Reference_Data.csv
├── general_data
│   ├── Commodities.csv
│   ├── Demand_Blocks.csv
│   ├── Input_Blocks.csv
│   ├── Inputs.csv
│   ├── Market_Power.csv
│   ├── Nodes.csv
│   ├── Origins.csv
│   ├── Temporal_Preferences.csv
│   ├── Timesteps.csv
│   └── Years.csv
├── inputs
│   ├── Availability_Factors.csv
│   ├── Capacity_Expansion_Limits.csv
│   ├── Cost_Parameters.csv
│   ├── Exogenous_Capacities.csv
│   ├── Investment_Cost_Parameters.csv
│   └── Lifetimes.csv
├── production
│   ├── Capacity_Expansion_Limits.csv
│   ├── Exogenous_Capacities.csv
│   └── Technology.csv
├── storage
│   ├── Capacities.csv
│   ├── Losses.csv
│   ├── Repurposing_Data.csv
│   └── Technologies.csv
├── trade
│   ├── Sanctions.csv
│   └── Specific_Market_Power.csv
└── transport
    ├── Commodity_Data.csv
    ├── Exogenous_Pipelines.csv
    ├── Pipeline_Adjacency.csv
    ├── Pipeline_Distances.csv
    ├── Repurposing_Data.csv
    ├── Shipping_Adjacency.csv
    └── Shipping_Distances.csv
```

The following table gives an overview of their contents. 

|Data Type|Directory Name|
|:---|:---|
|[Conversion Data](@ref)|```datafile/conversion```|
|[Demand Data](@ref)|```datafile/demand```|
|[General Data](@ref)|```datafile/general_data```|
|[Input Data](@ref)|```datafile/inputs```|
|[Production Data](@ref)|```datafile/production```|
|[Storage Data](@ref)|```datafile/storage```|
|[Trade Data](@ref)|```datafile/trade```|
|[Transport Data](@ref)|```datafile/transport```|

## Conversion Data
|File Path|Explanation|
|:---|:---|
|```datafile/conversion/Capacities.csv```|This dataset specifies conversion capacities on a time step basis (i.e. the conversion capacity in one hour/month/season etc., depending upon the setting). For every Node, and for every technology from Input Commodity to Output Commodity, the capacity during the corresponding year is given. |
|```datafile/conversion/Conversion_Data.csv```| This dataset specifies operational and investment cost, as well as lifetimes and factor intensities per conversion technology from Input Commodity to Output Commodity. Factor intensity implies, how much energy equivalent of one commodity is required to produce one energy equivalent of output. |
|```datafile/conversion/Repurposing.csv```|This dataset specifies unit repurposing costs from one technology to another. In addition, a conversion factor is included, accounting for energy specific differences in repurposing. |

## Demand Data
Inverse demand functions are assumed to follow a block-wise linear functional form:
```math
	\tilde{P}^{T \rightarrow D}_{ncbmy}(\sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}}q^{T \rightarrow D}_{tncbomy}) = \alpha^{D}_{ncbmy} + \beta^{D}_{ncbmy} (\sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}}q^{T \rightarrow D}_{tncbomy}) 
```

The parameters $$\alpha^{D}_{ncbmy}, \beta^{D}_{ncbmy}$$ from the mathematical formulation are subsequently defined around a reference point with an assumed price elasticity. This implies, that inverse demand curves are uniquely defined by supplying a set of reference quantity and price, as well as a given price elasticity. These data are used in the demand data set instead of directly computed $$\alpha^{D}_{ncbmy}, \beta^{D}_{ncbmy}$$. For ease of notation, the following equation will be used subsequently to abbreviate the total quantity consumed of commodity $c$ in block $b$ during time step $m$ of year $y$ in node $n$: 

```math
	Q_{ncbmy} = \sum_{o \in \mathcal{O}} \sum_{t \in \mathcal{T}}q^{T \rightarrow D}_{tncbomy} 
```

The partial derivative of the inverse demand with respect to total supply quantity is: 

```math
	\frac{\partial\tilde{P}^{T \rightarrow D}_{ncbmy}(Q_{ncbmy})}{\partial Q_{ncbmy} }
	= \beta^{D}_{ncbmy}
```

The price elasticity at a reference point defined by a reference price $$\bar{P}_{ncbmy}$$ and a reference quantity $$\bar{Q}_{ncbmy}$$ can be stated as: 

```math
    \epsilon^{\tilde{P}}_{ncbmy} = \frac{\partial Q_{ncbmy}}{\partial \tilde{P}^{T \rightarrow D}_{ncbmy} (Q_{ncbmy})} \frac{ \bar{P}_{ncbmy}} {\bar{Q}_{ncbmy}}
```

Rearranging yields: 

```math
	\frac{\partial \tilde{P}^{T \rightarrow D}_{ncbmy} (Q_{ncbmy})}{\partial Q_{ncbmy}}
	= \frac{ \bar{P}_{ncbmy}} {\bar{Q}_{ncbmy}} \frac{1}{\epsilon^{\tilde{P}}_{ncbmy} }
```

Which in turn yields:  

```math
	\beta^{D}_{ncbmy} = \frac{ \bar{P}_{ncbmy}} {\bar{Q}_{ncbmy}} \frac{1}{\epsilon^{\tilde{P}}_{ncbmy} }
```

Inserting this into the inverse demand function, we get:

```math
	\alpha^{D}_{ncbmy} = \bar{P}_{ncbmy} - \frac{ \bar{P}_{ncbmy}}{\epsilon^{\tilde{P}}_{ncbmy} }
```
|File Path|Explanation|
|:---|:---|
|```datafile/demand/Reference_Data.csv```|This dataset specifies reference consumption, prices and elasticities per node, commodity, timestep and demand block to calculate $$\alpha^{D}_{ncbmy}, \beta^{D}_{ncbmy}$$ from the mathematical formulation. |

## General Data
This dataset provides an overarching structure. Most notably, it determines which options from the datasets are actually included into the model data. 
!!! warning "Warning"
    If any element is not listed in this dataset, it will not be utilized by the model, despite being present in other data. This allows to quickly turn on/off model features without changing the fundamental data structure. 

|File Path|Explanation|
|:---|:---|
|```datafile/general_data/Commodities.csv```|Lists all modeled commodities. |
|```datafile/general_data/Demand_Blocks.csv```|Lists all modeled demand blocks. |
|```datafile/general_data/Input_Blocks.csv```|Lists all modeled input blocks. |
|```datafile/general_data/Inputs.csv```|Lists all modeled inputs. |
|```datafile/general_data/Market_Power.csv```|Lists conjectural variation factor for all commodities. 0 implies perfect competition, 1 implies Nash-Cournot.  |
|```datafile/general_data/Nodes.csv```|Lists all modeled nodes. Each node comes with a regional specific cost factor, a model region and a mapping to a nodal (domestic) trader. |
|```datafile/general_data/Origins.csv```|Lists all modeled origins. |
|```datafile/general_data/Temporal_Preferences.csv```|Indicates the assumed discount rate. |
|```datafile/general_data/Timesteps.csv```| Lists all time steps within a year, including their weight.|
|```datafile/general_data/Years.csv```|Lists all modeled years, including the step size between modeled years. |

## Input Data

|File Path|Explanation|
|:---|:---|
|```datafile/inputs/Availability_Factors.csv)```| Lists input capacity availabilities per input, node, and block. |
|```datafile/inputs/Capacity_Expansion_Limits.csv)```| Lists input procurement capacity expansion limits per input, node, block and year.|
|```datafile/inputs/Cost_Parameters.csv)```| Lists input procurement operational cost per input, node, block and year. |
|```datafile/inputs/Exogenous_Capacities.csv)```| Lists exogenous input procurement capacities per input, node, block and year.|
|```datafile/inputs/Investment_Cost_Parameters.csv)```| Lists input procurement investment cost per input, node, block and year. |
|```datafile/inputs/Lifetimes.csv)```| Lists lifetimes of input procurement technologies |

## Production Data

|File Path|Explanation|
|:---|:---|
|```datafile/production/Capacity_Expansion_Limits.csv```| Lists production capacity expansion limit per node, output, origin and year. |
|```datafile/production/Exogenous_Capacities.csv```| Lists exogenous production capacities per node, output, origin and year. |
|```datafile/production/Technology.csv```| Lists operational and investment cost for production, as well as factor intensities, origins and lifetimes per output. |

## Storage Data

|File Path|Explanation|
|:---|:---|
|```datafile/storage/Capacities.csv```| Lists exogenous storage capacity as well as capacity expansion limits. |
|```datafile/storage/Losses.csv```| Lists losses for storing between time steps for different commodities.|
|```datafile/storage/Repurposing_Data.csv```| Lists costs for different repurposing options, including a repurposing factor. |
|```datafile/storage/Technologies.csv```| Lists injection, extraction and investment costs, as well as storage lifetimes for different commodities. |

## Trade Data

|File Path|Explanation|
|:---|:---|
|```datafile/trade/Sanctions.csv```| Lists traders' yearly sales limits per node, commodity and origin. Can be used to prohibit sales from specific production origin or to include geopolitical aspects. |
|```datafile/trade/Specific_Market_Power.csv```| Lists exertion of market power by specific traders diverging from the default option per commodity.|

## Transport Data
Commodities are split into shipping-based and pipeline-based. For piped commodities, an explicit investment into specific routes must be made, while shipping-investment is assumed to be flexible, i.e. only distance dependent charges apply. 

|File Path|Explanation|
|:---|:---|
|```datafile/transport/Commodity_Data.csv```| Provides commodity specific data such as investment and operational cost per kkm, as well as asset lifetime. In addition, it is specified by which mode of transport a commodity must flow. |
|```datafile/transport/Exogenous_Pipelines.csv```| Indicates exogenous pipeline capacities between any two arcs.|
|```datafile/transport/Pipeline_Adjacency.csv```| Indicates if pipelines between two arcs are possible. This translates into the set $$\mathcal{AC}$$ from the mathematical description. |
|```datafile/transport/Pipeline_Distances.csv```| Indicates the transport distance for piped commodities. |
|```datafile/transport/Repurposing_Data.csv```| Indicates costs per kkm to repurpose capacity from one commodity to another on any arc.|
|```datafile/transport/Shipping_Adjacency.csv```| Indicates if shipping between two arcs is possible. This translates into the set $$\mathcal{AC}$$ from the mathematical description. |
|```datafile/transport/Shipping_Distances.csv```| Indicates the transport distance for shipped commodities. |