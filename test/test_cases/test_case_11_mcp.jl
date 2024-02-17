function test_case_11_mcp(config)
    @testset "Test Case 11" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_11"))
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
            @testset "Capacity Expansion GH2" begin
                @test isapprox(
                    result_value.(model[:Δ_P])["P_DEU", "GH2", "FES", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_P])["P_DEU", "GH2", "FES", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_P])["P_DEU", "GH2", "FES", 2030],
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Capacity Expansion CNG" begin
                @test isapprox(
                    result_value.(model[:Δ_P])["P_DEU", "CNG", "FES", 2020],
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_P])["P_DEU", "CNG", "FES", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_P])["P_DEU", "CNG", "FES", 2030],
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
