module HydrOGEnMod_Types

import JuMP

export Node,
    Producer,
    Trader,
    Origin,
    Commodity,
    Input,
    InputOperationalBlock,
    DemandBlock,
    ProductionTechnology,
    ConversionTechnology,
    RepurposingConversion,
    RepurposingStorage,
    RepurposingArcs,
    ArcAdjacencyCommodity,
    Timestep,
    TimestepMapping,
    Converter,
    TransportArc,
    Storage,
    Years,
    ModelData,
    InputData,
    ProductionData,
    TradeData,
    ConversionData,
    ArcData,
    StorageData,
    DemandData,
    get_name,
    get_node,
    get_input,
    get_output,
    get_old_input,
    get_old_output,
    get_new_input,
    get_new_output,
    get_from_throughput,
    get_to_throughput,
    get_from_input,
    get_to_input,
    get_conversion_technology,
    get_production_technology,
    get_repurposing_technology,
    all_indices

abstract type AbstractSet end

abstract type AbstractModelData end

abstract type AbstractParameterCollection end

const T = String

function Base.show(io::IO, set::AbstractSet)
    print(io, set.name)
end

"""
    get_name(v::AbstractSet)

Get the name (string) of an underlying struct, such as a model node.

Use broadcasting to retrieve a vector of names from a vector of objects.

# Examples
```julia-repl
julia> using HydrOGEnMod
julia> data = get_HydrOGEnMod_data();
julia> get_name.(data.nodes)
1-element Vector{String}:
 "DEU"
```
"""
function get_name(v::AbstractSet)
    return v.name
end

Base.@kwdef mutable struct Node <: AbstractSet
    name::T
    producer::T
    storage::T
    converter::T
    domestic_trader::T
    region::T
    cost_factor::Float64
    starting_arcs::Vector{T} = T[]
    ending_arcs::Vector{T} = T[]
end

Base.@kwdef mutable struct Producer <: AbstractSet
    name::T
    node::T
    trader::T
    cost_factor::Float64
end

Base.@kwdef mutable struct Trader <: AbstractSet
    name::T
    producers::Vector{T} = T[]
end

Base.@kwdef mutable struct TransportArc <: AbstractSet
    name::T
    start_node::T
    end_node::T
    inverse_arc::T
    cost_factor::Float64
    iterator::Tuple{T,T}
end

Base.@kwdef mutable struct Commodity <: AbstractSet
    name::T
    transport::T
end

Base.@kwdef mutable struct Origin <: AbstractSet
    name::T
end

Base.@kwdef mutable struct Input <: AbstractSet
    name::T
end

Base.@kwdef mutable struct InputOperationalBlock <: AbstractSet
    name::T
end

Base.@kwdef mutable struct DemandBlock <: AbstractSet
    name::T
end

Base.@kwdef mutable struct ProductionTechnology <: AbstractSet
    name::T
    commodity::T
    origin::T
    PT::Tuple{T,T}
end

Base.@kwdef mutable struct ConversionTechnology <: AbstractSet
    name::T
    input::T
    output::T
    CV::Tuple{T,T}
end

Base.@kwdef mutable struct RepurposingConversion <: AbstractSet
    name::T
    from_input::T
    from_output::T
    to_input::T
    to_output::T
    RV::Tuple{Tuple{T,T},Tuple{T,T}}
end

Base.@kwdef mutable struct RepurposingArcs <: AbstractSet
    name::T
    from_throughput::T
    to_throughput::T
    RA::Tuple{T,T}
end

Base.@kwdef mutable struct ArcAdjacencyCommodity
    AC::Vector{Tuple{T,T}} = Tuple{T,T}[]
    is_a_of_c::Dict{Tuple{T,T},Bool} = Dict{Tuple{T,T},Bool}()
end

Base.@kwdef mutable struct RepurposingStorage <: AbstractSet
    name::T
    from_input::T
    to_input::T
    RS::Tuple{T,T}
end

Base.@kwdef mutable struct Timestep <: AbstractSet
    name::T
    weights::Int64
    type::T
end

Base.@kwdef mutable struct TimestepMapping <: AbstractParameterCollection
    next_step::Dict{Union{T,Timestep},Union{T,Timestep}}
    previous_step::Dict{Union{T,Timestep},Union{T,Timestep}}
end

Base.@kwdef mutable struct Converter <: AbstractSet
    name::T
    node::T
    trader::T
    cost_factor::Float64
end

Base.@kwdef mutable struct Storage <: AbstractSet
    name::T
    node::T
    trader::T
    cost_factor::Float64
end

Base.@kwdef mutable struct Years <: AbstractSet
    range::StepRange{Int64,Int64}
    start::Int64
    step::Int64
    last::Int64
    weights::Int64
    name::T
end

Base.@kwdef mutable struct InputData <: AbstractParameterCollection
    c_Pl::JuMP.Containers.DenseAxisArray{Float64}
    c_Pq::JuMP.Containers.DenseAxisArray{Float64}
    av_I::JuMP.Containers.DenseAxisArray{Float64}
    Λ_I::JuMP.Containers.DenseAxisArray{Float64}
    Ω_I::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_I::JuMP.Containers.DenseAxisArray{Float64}
    L_I::JuMP.Containers.DenseAxisArray{Float64}
end

Base.@kwdef mutable struct ProductionData <: AbstractParameterCollection
    Λ_P::JuMP.Containers.DenseAxisArray{Float64}
    c_P::JuMP.Containers.DenseAxisArray{Float64}
    Ω_P::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_P::JuMP.Containers.DenseAxisArray{Float64}
    L_P::JuMP.Containers.DenseAxisArray{Float64}
    fi_P::JuMP.Containers.DenseAxisArray{Float64}
end

Base.@kwdef mutable struct TradeData <: AbstractParameterCollection
    NC::JuMP.Containers.DenseAxisArray{Float64}
    Λ_T::JuMP.Containers.SparseAxisArray{Float64,5,Tuple{T,T,T,T,Int64}}
end

Base.@kwdef mutable struct ConversionData <: AbstractParameterCollection
    Λ_V::JuMP.Containers.DenseAxisArray{Float64}
    c_V::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_V::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_RV::JuMP.Containers.DenseAxisArray{Float64}
    L_V::JuMP.Containers.DenseAxisArray{Float64}
    fi_V::JuMP.Containers.DenseAxisArray{Float64}
    f_RV::JuMP.Containers.DenseAxisArray{Float64}
end

Base.@kwdef mutable struct ArcData <: AbstractParameterCollection
    c_A::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_A::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_RA::JuMP.Containers.DenseAxisArray{Float64}
    Λ_A::JuMP.Containers.DenseAxisArray{Float64}
    l_a::JuMP.Containers.DenseAxisArray{Float64}
    L_A::JuMP.Containers.DenseAxisArray{Float64}
    f_RA::JuMP.Containers.DenseAxisArray{Float64}
end

Base.@kwdef mutable struct StorageData <: AbstractParameterCollection
    Λ_S::JuMP.Containers.DenseAxisArray{Float64}
    c_S_in::JuMP.Containers.DenseAxisArray{Float64}
    c_S_out::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_S::JuMP.Containers.DenseAxisArray{Float64}
    c_Δ_RS::JuMP.Containers.DenseAxisArray{Float64}
    l_S::JuMP.Containers.SparseAxisArray{Float64,3,Tuple{T,T,T}}
    L_S::JuMP.Containers.DenseAxisArray{Float64}
    Ω_S::JuMP.Containers.DenseAxisArray{Float64}
    f_RS::JuMP.Containers.DenseAxisArray{Float64}
end

Base.@kwdef mutable struct DemandData <: AbstractParameterCollection
    α_D::JuMP.Containers.DenseAxisArray{Float64}
    β_D::JuMP.Containers.DenseAxisArray{Float64}
end

Base.@kwdef mutable struct ModelData <: AbstractModelData
    timesteps::Vector{Timestep}
    timestep_mapping::TimestepMapping
    years::Years
    inputs::Vector{Input} = Input[]
    input_operational_blocks::Vector{InputOperationalBlock} = InputOperationalBlock[]
    demand_blocks::Vector{DemandBlock} = DemandBlock[]
    commodities::Vector{Commodity} = Commodity[]
    origins::Vector{Origin} = Origin[]
    nodes::Vector{Node}
    producers::Vector{Producer}
    production_technologies::Vector{ProductionTechnology} = ProductionTechnology[]
    traders::Vector{Trader}
    converters::Vector{Converter} = Converter[]
    arcs::Vector{TransportArc} = TransportArc[]
    repurposing_arc_technologies::Vector{RepurposingArcs} = RepurposingArcs[]
    arc_adjacency::ArcAdjacencyCommodity
    storages::Vector{Storage} = Storage[]
    repurposing_storage_technologies::Vector{RepurposingStorage} = RepurposingStorage[]
    conversion_technologies::Vector{ConversionTechnology} = ConversionTechnology[]
    repurposing_conversion_technologies::Vector{RepurposingConversion} =
        RepurposingConversion[]
    input_data::InputData
    production_data::ProductionData
    trade_data::TradeData
    conversion_data::ConversionData
    arc_data::ArcData
    storage_data::StorageData
    demand_data::DemandData
    weights::JuMP.Containers.DenseAxisArray{Int64}
    discount::JuMP.Containers.DenseAxisArray{Float64}
end

function get_node(v::Union{Producer,Converter,Storage})
    return v.node
end

function get_input(v::ConversionTechnology)
    return v.input
end

function get_output(v::ConversionTechnology)
    return v.output
end

function get_old_input(v::RepurposingConversion)
    return v.from_input
end

function get_old_output(v::RepurposingConversion)
    return v.from_output
end

function get_new_input(v::RepurposingConversion)
    return v.to_input
end

function get_new_output(v::RepurposingConversion)
    return v.to_output
end

function get_from_throughput(v::RepurposingArcs)
    return v.from_throughput
end

function get_to_throughput(v::RepurposingArcs)
    return v.to_throughput
end

function get_from_input(v::RepurposingStorage)
    return v.from_input
end

function get_to_input(v::RepurposingStorage)
    return v.to_input
end

function get_conversion_technology(v::ConversionTechnology)
    v.CV
end

function get_production_technology(v::ProductionTechnology)
    v.PT
end

function get_repurposing_technology(v::RepurposingConversion)
    return v.RV
end

function get_repurposing_technology(v::RepurposingArcs)
    return v.RA
end

function get_repurposing_technology(v::RepurposingStorage)
    return v.RS
end

function all_indices(collection::JuMP.Containers.SparseAxisArray)
    return eachindex(collection)
end

function all_indices(collection::JuMP.Containers.DenseAxisArray)
    return Base.Iterators.product(axes(collection)...)
end

end

using .HydrOGEnMod_Types
