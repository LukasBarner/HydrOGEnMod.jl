function test_case_18_mcp(config)
    @testset "Test Case 18" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_18"))
        model = build_complementarity_model(data)

        status = solve_mcp(model; output = "no")

        @testset "Results" begin
            @testset "Termination Status" begin
                @test status in [:Solved]
            end
            @testset "Prices" begin
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlyTimestep", 2020],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlyTimestep", 2025],
                    ),
                    1.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlyTimestep", 2030],
                    ),
                    0.99,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["NLD", "CNG", "Block 1", "OnlyTimestep", 2020],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["NLD", "CNG", "Block 1", "OnlyTimestep", 2025],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["NLD", "CNG", "Block 1", "OnlyTimestep", 2030],
                    ),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Capacity Expansion" begin
                @test isapprox(
                    result_value.(model[:Δ_A])["DEU_to_NLD", "CNG", 2020],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["NLD_to_DEU", "CNG", 2020],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["DEU_to_DEU", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["NLD_to_NLD", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )

                @test isapprox(
                    result_value.(model[:Δ_A])["DEU_to_NLD", "CNG", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["NLD_to_DEU", "CNG", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["DEU_to_DEU", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["NLD_to_NLD", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )

                @test isapprox(
                    result_value.(model[:Δ_A])["DEU_to_NLD", "CNG", 2030],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["NLD_to_DEU", "CNG", 2030],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["DEU_to_DEU", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_A])["NLD_to_NLD", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
