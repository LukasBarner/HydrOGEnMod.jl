"""
    plot_model_nodes(; nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"), disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"), colorscheme = :seaborn_colorblind6, unassigned_color = :gray85, strokecolor = :black, strokewidth = 0.1, size = (1600, 900), rasterize = false, map_title = "", legend_title = "Node Names", save_path = "",)

Plot an overview of the model nodes. 

Only active, if no positional argument is passed. 

# Keyword Arguments
- `nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson")`: Path where to find model nodes geojson file.
- `disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson")`: Path where to find disputed areas geojson file.
- `colorscheme = :seaborn_colorblind6`: Colorscheme for the model regions.
- `unassigned_color = :gray85`: Colorscheme for unassigned and disputed regions.
- `strokecolor = :black`: Strokecolor around regions.
- `strokewidth = 0.1`: Strokewidth around regions.
- `size = (1200, 900)`: Picture size.
- `rasterize = false`: Rasterization.
- `map_title = ""`: Specification of the title.
- `legend_title = "Node Names"`: Title of the legend.
- `save_path = ""`: Where to save the resulting graphic. Ending of filename automatically implies file format. 
"""
function plot_model_nodes(;
    nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"),
    disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"),
    colorscheme = :seaborn_colorblind6,
    unassigned_color = :gray85,
    strokecolor = :black,
    strokewidth = 0.1,
    size = (1200, 900),
    rasterize = false,
    map_title = "",
    legend_title = "Node Names",
    save_path = "",
)
    all_countries = GeoMakie.GeoJSON.read(nodes_path)
    disputed_areas = GeoMakie.GeoJSON.read(disputed_path)

    lons = -180:180
    lats = -90:90
    field = [exp(cosd(l)) + 3(y / 90) for l in lons, y in lats]

    modelnodes = String[]
    for i in all_countries
        push!(modelnodes, i.properties[:MODEL_NODE])
    end
    modelnodes = filter!(e -> e ∉ ["N.A."], unique(modelnodes))
    color_gradient = cgrad(colorscheme, length(modelnodes), categorical = true)
    colormap = Dict(zip(modelnodes, color_gradient))
    push!(colormap, ("N.A." => unassigned_color))
    legend_items = vcat(modelnodes, "N.A.")
    legend_markers = [
        PolyElement(
            color = colormap[i],
            strokecolor = strokecolor,
            strokewidth = strokewidth,
        ) for i in legend_items
    ]


    fig = Figure(size = size, fonts = (; regular = "CMU Serif", bold = "CMU Serif"))

    ax = GeoAxis(
        fig[1, 1];
        dest = "+proj=wintri",
        xgridcolor = (:grey, 0.5),
        ygridcolor= (:grey, 0.5),
    )

    Label(fig[1, 1, Top()], map_title, font = :bold)

    hm1 = surface!(
        ax,
        lons,
        lats,
        field;
        colormap = Reverse(:Blues_3),
        shading = NoShading,
        rasterize = rasterize, 
    )
    translate!(hm1, 0, 0, -10)

    hm3 = poly!(
        ax,
        disputed_areas;
        color = [unassigned_color for i in disputed_areas],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    hm2 = poly!(
        ax,
        all_countries;
        color = [colormap[i.properties[:MODEL_NODE]] for i in all_countries],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    Legend(
        fig[2, 1],
        legend_markers,
        legend_items,
        legend_title,
        orientation = :horizontal,
        nbanks = Int(round(length(legend_markers) / 3, RoundUp)),
    )

    length(save_path) > 0 && save(save_path, fig)

    return fig
end

"""
    plot_model_nodes(container::JuMP.Containers.DenseAxisArray{T,N,Ax,L}; nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"), disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"), colorscheme = :plasma, unassigned_color = :gray85, strokecolor = :black, strokewidth = 0.1, size = (1600, 900), rasterize = false, map_title = "", save_path = "") where {T,N,Ax,L<:NTuple{N,JuMP.Containers._AxisLookup}}

Plot the values inside container into the model node map. 

Separate methods implemented for DenseAxisArray and SparseAxisArray.

# Keyword Arguments
- `nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson")`: Path where to find model nodes geojson file.
- `disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson")`: Path where to find disputed areas geojson file.
- `colorscheme = :plasma`: Colorscheme for the model regions.
- `unassigned_color = :gray85`: Colorscheme for unassigned and disputed regions.
- `strokecolor = :black`: Strokecolor around regions.
- `strokewidth = 0.1`: Strokewidth around regions.
- `size = (1600, 900)`: Picture size.
- `rasterize = false`: Rasterization.
- `map_title = ""`: Specification of the title.
- `save_path = ""`: Where to save the resulting graphic. Ending of filename automatically implies file format. 
"""
function plot_model_nodes(
    container::JuMP.Containers.DenseAxisArray{T,N,Ax,L};
    nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"),
    disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"),
    colorscheme = :plasma,
    unassigned_color = :gray85,
    strokecolor = :black,
    strokewidth = 0.1,
    size = (1600, 900),
    rasterize = false,
    map_title = "",
    save_path = "",
    geojson_property_tag = :MODEL_NODE_3,
) where {T,N,Ax,L<:NTuple{N,JuMP.Containers._AxisLookup}}
    # @assert N==1 "Multidimensional array passed to function plot_model_nodes. This is not supported."
    all_countries = GeoMakie.GeoJSON.read(nodes_path)
    disputed_areas = GeoMakie.GeoJSON.read(disputed_path)

    lons = -180:180
    lats = -90:90
    field = [exp(cosd(l)) + 3(y / 90) for l in lons, y in lats]

    modelnodes = String[]
    for i in all_countries
        push!(modelnodes, i.properties[geojson_property_tag])
    end
    modelnodes = filter!(e -> e ∉ ["N.A.","P_N.A."], unique(modelnodes))
    @assert issetequal(modelnodes, axes(container)...) "Data to be plotted does not match given map data, make sure that model nodes are correctly mapped in file $nodes_path"

    fig = Figure(size = size, fonts = (; regular = "CMU Serif", bold = "CMU Serif"))

    ax = GeoAxis(
        fig[1, 1];
        dest = "+proj=wintri",
        xgridcolor = (:grey, 0.5),
        ygridcolor= (:grey, 0.5),
    )

    Label(fig[1, 1, Top()], map_title, font = :bold)

    hm1 = surface!(
        ax,
        lons,
        lats,
        field;
        colormap = Reverse(:Blues_3),
        shading = NoShading,
        rasterize = rasterize, 
    )
    translate!(hm1, 0, 0, -10)

    hm3 = poly!(
        ax,
        disputed_areas;
        color = [unassigned_color for i in disputed_areas],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    hm2 = poly!(
        ax,
        all_countries;
        color = [
            i.properties[geojson_property_tag] ∈ axes(container)... ?
            container[i.properties[geojson_property_tag]] : NaN for i in all_countries
        ],
        colormap = colorscheme,
        nan_color = unassigned_color,
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    cb_lims = extrema(container.data) .+ (-1e-12,1e-12)

    subgrid = GridLayout(fig[2, 1])

    lower_label_cb_lims, upper_label_cb_lims = replace.(map( x-> @sprintf("%.3g", x), collect(cb_lims)), "-" => "−")

    Label(subgrid[1, 1], lower_label_cb_lims, padding = (40,0,20,20))
    Label(subgrid[1, 3], upper_label_cb_lims, padding = (0,20,20,20))

    cb = Colorbar(
        subgrid[1, 2];
        limits = cb_lims,
        colormap = colorscheme,
        vertical = false,
        highclip = unassigned_color,
        lowclip = unassigned_color,
    )

    length(save_path) > 0 && save(save_path, fig)

    return fig
end

"""
    plot_model_nodes(container::JuMP.Containers.SparseAxisArray{T,N,K}; nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"), disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"), colorscheme = :plasma, unassigned_color = :gray85, strokecolor = :black, strokewidth = 0.1, size = (1600, 900), rasterize = false, map_title = "", save_path = "")    

Plot the values inside container into the model node map. 

Separate methods implemented for DenseAxisArray and SparseAxisArray.

# Keyword Arguments
- `nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson")`: Path where to find model nodes geojson file.
- `disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson")`: Path where to find disputed areas geojson file.
- `colorscheme = :plasma`: Colorscheme for the model regions.
- `unassigned_color = :gray85`: Colorscheme for unassigned and disputed regions.
- `strokecolor = :black`: Strokecolor around regions.
- `strokewidth = 0.1`: Strokewidth around regions.
- `size = (1600, 900)`: Picture size.
- `rasterize = false`: Rasterization.
- `map_title = ""`: Specification of the title.
- `save_path = ""`: Where to save the resulting graphic. Ending of filename automatically implies file format. 

"""
function plot_model_nodes(
    container::JuMP.Containers.SparseAxisArray{T,N,K};
    nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"),
    disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"),
    colorscheme = :plasma,
    unassigned_color = :gray85,
    strokecolor = :black,
    strokewidth = 0.1,
    size = (1600, 900),
    rasterize = false, 
    map_title = "",
    save_path = "",
    geojson_property_tag = :MODEL_NODE_3,
) where {T,N,K<:NTuple{N,Any}}
    all_countries = GeoMakie.GeoJSON.read(nodes_path)
    disputed_areas = GeoMakie.GeoJSON.read(disputed_path)

    lons = -180:180
    lats = -90:90
    field = [exp(cosd(l)) + 3(y / 90) for l in lons, y in lats]

    modelnodes = String[]
    for i in all_countries
        push!(modelnodes, i.properties[geojson_property_tag])
    end
    modelnodes = filter!(e -> e ∉ ["N.A."], unique(modelnodes))
    idxs = [
        length(i) == 1 ? i[1] :
        error(
            "Multi dimensional array passed to plot_model_nodes(container::JuMP.Containers.SparseAxisArray{T,N,K}) with key $i",
        ) for i in keys(container.data)
    ]

    @assert issetequal(modelnodes, idxs) "Data to be plotted does not match given map data, make sure that model nodes are correctly mapped in file $nodes_path"

    fig = Figure(size = size, fonts = (; regular = "CMU Serif", bold = "CMU Serif"))

    ax = GeoAxis(
        fig[1, 1];
        dest = "+proj=wintri",
        xgridcolor = (:grey, 0.5),
        ygridcolor= (:grey, 0.5),
    )

    Label(fig[1, 1, Top()], map_title, font = :bold)

    hm1 = surface!(
        ax,
        lons,
        lats,
        field;
        colormap = Reverse(:Blues_3),
        shading = NoShading,
        rasterize = rasterize, 
    )
    translate!(hm1, 0, 0, -10)

    hm3 = poly!(
        ax,
        disputed_areas;
        color = [unassigned_color for i in disputed_areas],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    hm2 = poly!(
        ax,
        all_countries;
        color = [
            i.properties[geojson_property_tag] ∈ idxs ?
            container[i.properties[geojson_property_tag]] : NaN for i in all_countries
        ],
        colormap = colorscheme,
        nan_color = unassigned_color,
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    cb_lims = extrema(values(container.data)) .+ (-1e-12,1e-12)

    subgrid = GridLayout(fig[2, 1])

    lower_label_cb_lims, upper_label_cb_lims = replace.(map( x-> @sprintf("%.3g", x), collect(cb_lims)), "-" => "−")

    Label(subgrid[1, 1], lower_label_cb_lims, padding = (40,0,20,20))
    Label(subgrid[1, 3], upper_label_cb_lims, padding = (0,20,20,20))
    
    cb = Colorbar(
        subgrid[1, 2];
        limits = cb_lims,
        colormap = colorscheme,
        vertical = false,
        highclip = unassigned_color,
        lowclip = unassigned_color,
    )

    length(save_path) > 0 && save(save_path, fig)

    return fig
end

"""
    plot_model_nodes(arcs::Vector{TransportArc}; nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"), disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"), centroids_path = joinpath(@__DIR__, "maps", "centroids.csv"), colorscheme = :seaborn_colorblind6, unassigned_color = :gray85, strokecolor = :black, strokewidth = 0.1, linewidth = 0.2, linecolor = :black, size = (1600, 900), rasterize = false, map_title = "", save_path = "")

Plot the passed arcs into the model node map. 

Separate method implemented for also passing arc values.

# Keyword Arguments
- `nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson")`: Path where to find model nodes geojson file.
- `disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson")`: Path where to find disputed areas geojson file.
- `centroids_path = joinpath(@__DIR__, "maps", "centroids.csv")`: Path where to find model region centroids file.
- `colorscheme = :seaborn_colorblind6`: Colorscheme for the model regions.
- `unassigned_color = :gray85`: Colorscheme for unassigned and disputed regions.
- `strokecolor = :black`: Strokecolor around regions.
- `strokewidth = 0.1`: Strokewidth around regions.
- `linewidth = 0.2`: Arc linewidth connecting nodes.
- `linecolor = :black`: Color of arcs connecting nodes.
- `size = (1600, 900)`: Picture size.
- `rasterize = false`: Rasterization.
- `map_title = ""`: Specification of the title.
- `save_path = ""`: Where to save the resulting graphic. Ending of filename automatically implies file format. 

"""
function plot_model_nodes(
    arcs::Vector{TransportArc};
    nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"),
    disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"),
    centroids_path = joinpath(@__DIR__, "maps", "centroids.csv"),
    colorscheme = :seaborn_colorblind6,
    unassigned_color = :gray85,
    strokecolor = :black,
    strokewidth = 0.1,
    linewidth = 0.2,
    linecolor = :black,
    size = (1600, 900),
    rasterize = false, 
    map_title = "",
    save_path = "",
)
    all_countries = GeoMakie.GeoJSON.read(nodes_path)
    disputed_areas = GeoMakie.GeoJSON.read(disputed_path)
    centroids_df = CSV.read(centroids_path, DataFrame)
    centroids = Dict(
        row.MODEL_NODE_3 => (lat = row.lat, lon = row.lon) for row in eachrow(centroids_df)
    )

    lons = -180:180
    lats = -90:90
    field = [exp(cosd(l)) + 3(y / 90) for l in lons, y in lats]

    modelnodes = String[]
    for i in all_countries
        push!(modelnodes, i.properties[:MODEL_NODE])
    end
    modelnodes = filter!(e -> e ∉ ["N.A."], unique(modelnodes))
    color_gradient = cgrad(colorscheme, length(modelnodes), categorical = true)
    colormap = Dict(zip(modelnodes, color_gradient))
    push!(colormap, ("N.A." => unassigned_color))
    legend_items = vcat(modelnodes, "N.A.")
    legend_markers = [
        PolyElement(
            color = colormap[i],
            strokecolor = strokecolor,
            strokewidth = strokewidth,
        ) for i in legend_items
    ]

    fig = Figure(size = size, fonts = (; regular = "CMU Serif", bold = "CMU Serif"))

    ax = GeoAxis(
        fig[1, 1];
        dest = "+proj=wintri",
        xgridcolor = (:grey, 0.5),
        ygridcolor= (:grey, 0.5),
    )

    Label(fig[1, 1, Top()], map_title, font = :bold)

    hm1 = surface!(
        ax,
        lons,
        lats,
        field;
        colormap = Reverse(:Blues_3),
        shading = NoShading,
        rasterize = rasterize, 
    )
    translate!(hm1, 0, 0, -10)

    hm3 = poly!(
        ax,
        disputed_areas;
        color = [unassigned_color for i in disputed_areas],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    hm2 = poly!(
        ax,
        all_countries;
        color = [colormap[i.properties[:MODEL_NODE]] for i in all_countries],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    for a in arcs
        arrows!(
            ax,
            [centroids[a.start_node].lon],
            [centroids[a.start_node].lat],
            [centroids[a.end_node].lon - centroids[a.start_node].lon],
            [centroids[a.end_node].lat - centroids[a.start_node].lat];
            color = linecolor,
            linewidth = linewidth,
        )
    end

    length(save_path) > 0 && save(save_path, fig)

    return fig
end

"""
    plot_model_nodes(container::JuMP.Containers.DenseAxisArray{T,N,Ax,L}, arcs::Vector{TransportArc}; nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"), disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"), centroids_path = joinpath(@__DIR__, "maps", "centroids.csv"), colorscheme = :seaborn_colorblind6, unassigned_color = :gray85, strokecolor = :black, strokewidth = 0.1, linewidth = 1, linecolorscheme = :plasma, size = (1600, 900), rasterize = false, largestvalues = 10, map_title = "", save_path = "") where {T,N,Ax,L<:NTuple{N,JuMP.Containers._AxisLookup}}

Plot the passed arcs with coloring corresponding to given values in the container into the model node map. 

Separate method implemented for just plotting normal values.

# Keyword Arguments
- `nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson")`: Path where to find model nodes geojson file.
- `disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson")`: Path where to find disputed areas geojson file.
- `centroids_path = joinpath(@__DIR__, "maps", "centroids.csv")`: Path where to find model region centroids file.
- `colorscheme = :seaborn_colorblind6`: Colorscheme for the model regions.
- `unassigned_color = :gray85`: Colorscheme for unassigned and disputed regions.
- `strokecolor = :black`: Strokecolor around regions.
- `strokewidth = 0.1`: Strokewidth around regions.
- `linewidth = 1`: Arc linewidth connecting nodes.
- `linecolorscheme = :plasma`: Colorscheme for coloring arcs connecting regions based on container values.
- `size = (1600, 900)`: Picture size.
- `rasterize = false`: Rasterization.
- `largestvalues = 10`: The n largest arc values and equal to select.
- `minval = 1`: The smallest value to include in the arc plot.
- `map_title = ""`: Specification of the title.
- `save_path = ""`: Where to save the resulting graphic. Ending of filename automatically implies file format.

"""
function plot_model_nodes(
    container::JuMP.Containers.DenseAxisArray{T,N,Ax,L},
    arcs::Vector{TransportArc};
    nodes_path = joinpath(@__DIR__, "maps", "WB_countries_Admin0_modified.geojson"),
    disputed_path = joinpath(@__DIR__, "maps", "WB_Admin0_disputed_areas_modified.geojson"),
    centroids_path = joinpath(@__DIR__, "maps", "centroids.csv"),
    colorscheme = :seaborn_colorblind6,
    unassigned_color = :gray85,
    strokecolor = :black,
    strokewidth = 0.1,
    linewidth = 1,
    linecolorscheme = :plasma,
    size = (1600, 900),
    rasterize = false, 
    largestvalues = 10,
    minval = 1,
    map_title = "",
    save_path = "",
) where {T,N,Ax,L<:NTuple{N,JuMP.Containers._AxisLookup}}
    all_countries = GeoMakie.GeoJSON.read(nodes_path)
    disputed_areas = GeoMakie.GeoJSON.read(disputed_path)
    centroids_df = CSV.read(centroids_path, DataFrame)
    centroids = Dict(
        row.MODEL_NODE_3 => (lat = row.lat, lon = row.lon) for row in eachrow(centroids_df)
    )

    lons = -180:180
    lats = -90:90
    field = [exp(cosd(l)) + 3(y / 90) for l in lons, y in lats]

    modelnodes = String[]
    for i in all_countries
        push!(modelnodes, i.properties[:MODEL_NODE])
    end
    modelnodes = filter!(e -> e ∉ ["N.A."], unique(modelnodes))
    color_gradient = cgrad(colorscheme, length(modelnodes), categorical = true)
    colormap = Dict(zip(modelnodes, color_gradient))
    push!(colormap, ("N.A." => unassigned_color))
    legend_items = vcat(modelnodes, "N.A.")
    legend_markers = [
        PolyElement(
            color = colormap[i],
            strokecolor = strokecolor,
            strokewidth = strokewidth,
        ) for i in legend_items
    ]

    @assert length(container.axes) == 1 "Invalid dimensionality, $(length(container.axes)) dimensions found"

    cutoff = max(partialsort(container.data, largestvalues, rev = true), minval)
    container_relevant_idxs = findall(x -> x >= cutoff, container.data)
    relevant_values = Dict(
        zip(
            container.axes[1][container_relevant_idxs],
            container.data[container_relevant_idxs],
        ),
    )
    color_gradient_relevant_vals = cgrad(linecolorscheme)

    fig = Figure(size = size, fonts = (; regular = "CMU Serif", bold = "CMU Serif"))

    if !isempty(relevant_values)
        cb_lims = extrema(values(relevant_values)) .+ (-1e-12,1e-12)
    else
        cb_lims = (-1e-12,1e-12)
    end

    ax = GeoAxis(
        fig[1, 1];
        dest = "+proj=wintri",
        xgridcolor = (:grey, 0.5),
        ygridcolor= (:grey, 0.5),
    )

    Label(fig[1, 1, Top()], map_title, font = :bold)

    hm1 = surface!(
        ax,
        lons,
        lats,
        field;
        colormap = Reverse(:Blues_3),
        shading = NoShading,
        rasterize = rasterize, 
    )
    translate!(hm1, 0, 0, -10)

    hm3 = poly!(
        ax,
        disputed_areas;
        color = [unassigned_color for i in disputed_areas],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    hm2 = poly!(
        ax,
        all_countries;
        color = [colormap[i.properties[:MODEL_NODE]] for i in all_countries],
        strokecolor = strokecolor,
        strokewidth = strokewidth,
        rasterize = rasterize, 
    )

    for a in arcs
        if get_name(a) in keys(relevant_values)
            arrows!(
                ax,
                [centroids[a.start_node].lon],
                [centroids[a.start_node].lat],
                [centroids[a.end_node].lon - centroids[a.start_node].lon],
                [centroids[a.end_node].lat - centroids[a.start_node].lat];
                color = color_gradient_relevant_vals[(relevant_values[get_name(
                    a,
                )]-cutoff)/(cb_lims[2]-cutoff)],
                linewidth = linewidth,
            )
        end
    end

    subgrid = GridLayout(fig[2, 1])
    
    lower_label_cb_lims, upper_label_cb_lims = replace.(map( x-> @sprintf("%.3g", x), collect(cb_lims)), "-" => "−")

    Label(subgrid[1, 1], lower_label_cb_lims, padding = (40,0,20,20))
    Label(subgrid[1, 3], upper_label_cb_lims, padding = (0,20,20,20))
    
    cb = Colorbar(
        subgrid[1, 2];
        limits = cb_lims,
        colormap = linecolorscheme,
        vertical = false,
        highclip = unassigned_color,
        lowclip = unassigned_color,
    )

    length(save_path) > 0 && save(save_path, fig)

    return fig
end
