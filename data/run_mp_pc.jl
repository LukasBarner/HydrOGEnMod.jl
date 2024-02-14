using HydrOGEnMod
using Gurobi
using JuMP

pc_results_path = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "results", "pc")

data_pc = get_HydrOGEnMod_data(
    data = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_pc"),
);
write_csv(joinpath(pc_results_path, "precalculated"), data_pc)

model_pc = build_optimization_model(data_pc)

optimize!(model_pc, Gurobi.Optimizer)
write_csv(pc_results_path, model_pc)

for y in [2030, 2050], c in ["GH2", "NH3", "LH2"]
    for s in ["L", "H"]
        if c ∉ ["LH2"]
            plot_model_nodes(
                value.(model_pc[:prices][:, c, "Block 1", s, y]);
                map_title = "Prices for $c in Season $s $y Perfect Competition\n",
                save_path = joinpath(
                    pc_results_path,
                    "graphics",
                    "pc_prices_$(c)_$(s)_$(y).pdf",
                ),
                rasterize = 1,
            )
            plot_model_nodes(
                value.(model_pc[:demand][:, c, "Block 1", s, y]);
                map_title = "Demand for $c in Season $s $y Perfect Competition\n",
                save_path = joinpath(
                    pc_results_path,
                    "graphics",
                    "pc_demand_$(c)_$(s)_$(y).pdf",
                ),
                rasterize = 1,
            )
        end
    end

    plot_model_nodes(
        value.(model_pc[:yearly_demand][:, c, y]);
        map_title = "Annual Demand for $c in $y Perfect Competition\n",
        save_path = joinpath(pc_results_path, "graphics", "pc_demand_$(c)_$(y).pdf"),
        rasterize = 1,
    )

    plot_model_nodes(
        value.(model_pc[:yearly_production][:, c, y]);
        map_title = "Annual Production for $c in $y Perfect Competition\n",
        save_path = joinpath(pc_results_path, "graphics", "pc_production_$(c)_$(y).pdf"),
        geojson_property_tag = :MODEL_PRODUCER_5,
        rasterize = 1,
    )

    plot_model_nodes(
        value.(model_pc[:yearly_arc_flows][:, c, y]),
        data_pc.arcs;
        map_title = "Largest Trade Flows $c $y Perfect Competition\n",
        save_path = joinpath(pc_results_path, "graphics", "pc_trade_flows_$(c)_$(y).pdf"),
        colorscheme = :linear_gow_65_90_c35_n256,
        linewidth = 2,
        largestvalues = 50,
        rasterize = 1,
    )

    for i in ["Renewable Hydrogen", "Nuclear Hydrogen"]
        plot_model_nodes(
            value.(model_pc[:yearly_input_procurement][:, i, y]);
            map_title = "Annual Procurement of $i in $y Perfect Competition\n",
            save_path = joinpath(
                pc_results_path,
                "graphics",
                "pc_procurement_$(i)_$(y).pdf",
            ),
            geojson_property_tag = :MODEL_PRODUCER_5,
            rasterize = 1,
        )
    end
end

########################################################

mp_results_path = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "results", "mp")

data_mp = get_HydrOGEnMod_data(
    data = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "data", "data_mp"),
);

write_csv(joinpath(mp_results_path, "precalculated"), data_mp)
model_mp = build_optimization_model(data_mp)

optimize!(model_mp, Gurobi.Optimizer)
write_csv(mp_results_path, model_mp)
for y in [2030, 2050], c in ["GH2", "NH3", "LH2"]
    for s in ["L", "H"]
        if c ∉ ["LH2"]
            plot_model_nodes(
                value.(model_mp[:prices][:, c, "Block 1", s, y]);
                map_title = "Prices for $c in Season $s $y Imperfect Competition\n",
                save_path = joinpath(
                    mp_results_path,
                    "graphics",
                    "mp_prices_$(c)_$(s)_$(y).pdf",
                ),
                rasterize = 1,
            )
            plot_model_nodes(
                value.(model_mp[:demand][:, c, "Block 1", s, y]);
                map_title = "Demand for $c in Season $s $y Imperfect Competition\n",
                save_path = joinpath(
                    mp_results_path,
                    "graphics",
                    "mp_demand_$(c)_$(s)_$(y).pdf",
                ),
                rasterize = 1,
            )
        end
    end

    plot_model_nodes(
        value.(model_mp[:yearly_demand][:, c, y]);
        map_title = "Annual Demand for $c in $y Imperfect Competition\n",
        save_path = joinpath(mp_results_path, "graphics", "mp_demand_$(c)_$(y).pdf"),
        rasterize = 1,
    )

    plot_model_nodes(
        value.(model_mp[:yearly_production][:, c, y]);
        map_title = "Annual Production for $c in $y Imperfect Competition\n",
        save_path = joinpath(mp_results_path, "graphics", "mp_production_$(c)_$(y).pdf"),
        geojson_property_tag = :MODEL_PRODUCER_5,
        rasterize = 1,
    )

    plot_model_nodes(
        value.(model_mp[:yearly_arc_flows][:, c, y]),
        data_mp.arcs;
        map_title = "Largest Trade Flows $c $y Imperfect Competition\n",
        save_path = joinpath(mp_results_path, "graphics", "mp_trade_flows_$(c)_$(y).pdf"),
        colorscheme = :linear_gow_65_90_c35_n256,
        linewidth = 2,
        largestvalues = 50,
        rasterize = 1,
    )

    for i in ["Renewable Hydrogen", "Nuclear Hydrogen"]
        plot_model_nodes(
            value.(model_mp[:yearly_input_procurement][:, i, y]);
            map_title = "Annual Procurement of $i in $y Imperfect Competition\n",
            save_path = joinpath(
                mp_results_path,
                "graphics",
                "mp_procurement_$(i)_$(y).pdf",
            ),
            geojson_property_tag = :MODEL_PRODUCER_5,
            rasterize = 1,
        )
    end
end

diff_plots_path = joinpath(dirname(dirname(pathof(HydrOGEnMod))), "results", "diff")

for y in [2030, 2050]
    for s in ["L", "H"], c in ["GH2", "NH3"]
        plot_model_nodes(
            value.((
                model_mp[:prices][:, c, "Block 1", s, y] .-
                model_pc[:prices][:, c, "Block 1", s, y]
            ));
            map_title = "Price Difference against Perfect Competition $s $c $y\n",
            save_path = joinpath(diff_plots_path, "diff_prices_$(c)_$(s)_$(y).pdf"),
            rasterize = 1,
        )
    end

    for i in ["Renewable Hydrogen", "Nuclear Hydrogen"]
        plot_model_nodes(
            value.(
                model_mp[:yearly_input_procurement][:, i, y] .-
                model_pc[:yearly_input_procurement][:, i, y]
            );
            map_title = "Difference in Annual Procurement of $i in $y Imperfect Competition\n",
            save_path = joinpath(diff_plots_path, "diff_procurement_$(i)_$(y).pdf"),
            geojson_property_tag = :MODEL_PRODUCER_5,
            rasterize = 1,
        )
    end
end
