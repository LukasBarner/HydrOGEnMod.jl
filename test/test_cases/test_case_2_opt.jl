function test_case_2_opt(config)
    @testset "Test Case 2" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "test_2"))
        model = build_optimization_model(data)

        optimize!(
            model,
            config.optimizer,
            config.solver_options...
        )

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "OnlySeason", 2020],
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlySeason", 2020],
                    1.25,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "OnlySeason", 2021],
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlySeason", 2021],
                    1.25,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
