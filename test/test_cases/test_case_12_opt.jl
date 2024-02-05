function test_case_12_opt(config)
    @testset "Test Case 12" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "test_12"))
        model = build_optimization_model(data)

        optimize!(
            model,
            config.optimizer,
            config.solver_options...,
        )

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices GH2" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "OnlySeason", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "OnlySeason", 2025],
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "GH2", "Block 1", "OnlySeason", 2030],
                    0.99,
                    atol = config.testing_tol,
                )
            end
            @testset "Prices CNG" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlySeason", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlySeason", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlySeason", 2030],
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Capacity Expansion" begin
                @test isapprox(
                    value.(model[:Δ_V])["V_DEU", "CNG", "GH2", 2020],
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_V])["V_DEU", "CNG", "GH2", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_V])["V_DEU", "CNG", "GH2", 2030],
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
