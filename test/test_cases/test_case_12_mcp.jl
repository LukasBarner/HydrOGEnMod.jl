function test_case_12_mcp(config)
    @testset "Test Case 12" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_12"))
        model = build_complementarity_model(data)

        status = solve_mcp(model; output = "no")

        @testset "Results" begin
            @testset "Termination Status" begin
                @test status in [:Solved]
            end
            @testset "Prices GH2" begin
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "GH2", "Block 1", "OnlyTimestep", 2020],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "GH2", "Block 1", "OnlyTimestep", 2025],
                    ),
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "GH2", "Block 1", "OnlyTimestep", 2030],
                    ),
                    0.99,
                    atol = config.testing_tol,
                )
            end
            @testset "Prices CNG" begin
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
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlyTimestep", 2030],
                    ),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Capacity Expansion" begin
                @test isapprox(
                    result_value.(model[:Δ_V])["V_DEU", "CNG", "GH2", 2020],
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_V])["V_DEU", "CNG", "GH2", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_V])["V_DEU", "CNG", "GH2", 2030],
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
