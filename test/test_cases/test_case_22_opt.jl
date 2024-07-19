function test_case_22_opt(config)
    @testset "Test Case 22" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_22"))
        model = build_optimization_model(data)

        optimize!(model, config.optimizer, config.solver_options...)

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "L", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "H", 2020],
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "L", 2021],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "H", 2021],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "L", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "H", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "L", 2021],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "H", 2021],
                    1,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
                @test isapprox(
                    value.(model[:q_I])["P_DEU", "Natural Gas", "Block 1", "L", 2020],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:q_I])["P_DEU", "Natural Gas", "Block 1", "H", 2020],
                    0.0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:q_I])["P_DEU", "Natural Gas", "Block 1", "L", 2021],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:q_I])["P_DEU", "Natural Gas", "Block 1", "H", 2021],
                    0.0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
