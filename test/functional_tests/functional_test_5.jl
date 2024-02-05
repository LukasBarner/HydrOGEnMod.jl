function functional_test_5(config)
    @testset "Functional Test 5" begin
        nodes_path =
            joinpath(@__DIR__, "functional_test_5", "WB_countries_Admin0_modified.geojson")
        disputed_path = joinpath(
            @__DIR__,
            "functional_test_5",
            "WB_Admin0_disputed_areas_modified.geojson",
        )
        centroids_path = joinpath(@__DIR__, "functional_test_5", "centroids.csv")

        nodes_vec = [
            "PAC",
            "SWA",
            "SEA",
            "SEE",
            "IND",
            "CHN",
            "LEV",
            "EAF",
            "IRN",
            "SWE",
            "JSK",
            "NAF",
            "CEA",
            "WAF",
            "EAS",
            "EAE",
            "RUS",
            "SAF",
            "GLF",
            "CAS",
            "CEE",
            "NOE",
            "BRI",
            "USA",
            "CAN",
            "ANZ",
        ]
        arcs_vec = HydrOGEnMod.TransportArc[]
        for ne in nodes_vec, ni in nodes_vec
            a = HydrOGEnMod.TransportArc(
                name = "$(ne)_to_$(ni)",
                start_node = ne,
                end_node = ni,
                inverse_arc = "$(ni)_to_$(ne)",
                cost_factor = 1,
                iterator = (ne, ni),
            )
            push!(arcs_vec, a)
        end

        @testset "Simple Model Node Plot" begin
            @test isa(
                plot_model_nodes(; nodes_path = nodes_path, disputed_path = disputed_path),
                Figure,
            )
        end

        @testset "DenseAxisArray Model Node Plot" begin
            tst_dense = JuMP.Containers.DenseAxisArray(
                10 * rand(26, 2, 3),
                nodes_vec,
                ["Season 1", "Season 2"],
                2020:5:2030,
            )
            @test isa(
                plot_model_nodes(
                    tst_dense[:, "Season 1", 2020];
                    nodes_path = nodes_path,
                    disputed_path = disputed_path,
                ),
                Figure,
            )
        end

        @testset "SparseAxisArray Model Node Plot" begin
            tst_sparse = JuMP.Containers.SparseAxisArray(
                Dict(
                    (i, j, k) => 10 * rand() for i in nodes_vec,
                    j in ["Season 1", "Season 2"], k = 2020:5:2030
                ),
            )
            @test isa(
                plot_model_nodes(
                    tst_sparse[:, "Season 1", 2020];
                    nodes_path = nodes_path,
                    disputed_path = disputed_path,
                ),
                Figure,
            )
        end

        @testset "Arcs Plot" begin
            @test isa(
                plot_model_nodes(
                    arcs_vec;
                    nodes_path = nodes_path,
                    disputed_path = disputed_path,
                    centroids_path = centroids_path,
                ),
                Figure,
            )
        end

        @testset "Colored Arcs Plot" begin
            tst_arcs = JuMP.Containers.DenseAxisArray(
                10 * rand(26^2, 2, 2, 3),
                get_name.(arcs_vec),
                ["GH2", "CNG"],
                ["Season 1", "Season 2"],
                2020:5:2030,
            )
            @test isa(
                plot_model_nodes(
                    tst_arcs[:, "GH2", "Season 1", 2020],
                    arcs_vec;
                    nodes_path = nodes_path,
                    disputed_path = disputed_path,
                    centroids_path = centroids_path,
                ),
                Figure,
            )
        end
    end
end
