function test_case_16_mcp(config)
    @testset "Test Case 16" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_16"))
        model = build_complementarity_model(data)

        status = solve_mcp(model; output = "no")

        @testset "Results" begin
            @testset "Termination Status" begin
                @test status in [:Solved]
            end
            @testset "Prices" begin
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "L", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "L", 2025]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "L", 2030]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "H", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "H", 2025]),
                    2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "H", 2030]),
                    0.99,
                    atol = config.testing_tol,
                )
            end
            @testset "Capacity Expansion" begin
                @test isapprox(
                    result_value.(model[:Δ_S])["S_DEU", "CNG", 2020],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_S])["S_DEU", "CNG", 2025],
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:Δ_S])["S_DEU", "CNG", 2030],
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
