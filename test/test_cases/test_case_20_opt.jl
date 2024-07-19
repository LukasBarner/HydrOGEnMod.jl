function test_case_20_opt(config)
    @testset "Test Case 20" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_20"))
        model = build_optimization_model(data)

        optimize!(model, config.optimizer, config.solver_options...)

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "OnlyTimestep", 2020],
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "NH3", "Block 1", "OnlyTimestep", 2020],
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2020],
                    1.25,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "OnlyTimestep", 2021],
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "NH3", "Block 1", "OnlyTimestep", 2021],
                    1.50,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2021],
                    1.5,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
