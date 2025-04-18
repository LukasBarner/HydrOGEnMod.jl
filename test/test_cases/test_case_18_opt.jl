function test_case_18_opt(config)
    @testset "Test Case 18" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_18"))
        model = build_optimization_model(data)

        optimize!(model, config.optimizer, config.solver_options...)

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2025],
                    1.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2030],
                    0.99,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["NLD", "CNG", "Block 1", "OnlyTimestep", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["NLD", "CNG", "Block 1", "OnlyTimestep", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["NLD", "CNG", "Block 1", "OnlyTimestep", 2030],
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Capacity Expansion" begin
                @test isapprox(
                    value.(model[:Δ_A])["DEU_to_NLD", "CNG", 2020],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["NLD_to_DEU", "CNG", 2020],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["DEU_to_DEU", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["NLD_to_NLD", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )

                @test isapprox(
                    value.(model[:Δ_A])["DEU_to_NLD", "CNG", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["NLD_to_DEU", "CNG", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["DEU_to_DEU", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["NLD_to_NLD", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )

                @test isapprox(
                    value.(model[:Δ_A])["DEU_to_NLD", "CNG", 2030],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["NLD_to_DEU", "CNG", 2030],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["DEU_to_DEU", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:Δ_A])["NLD_to_NLD", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
