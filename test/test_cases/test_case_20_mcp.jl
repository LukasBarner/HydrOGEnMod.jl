function test_case_20_mcp(config)
    @testset "Test Case 20" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_20"))
        model = build_complementarity_model(data)

        status = solve_mcp(model; output = "no")

        @testset "Results" begin
            @testset "Termination Status" begin
                @test status in [:Solved]
            end
            @testset "Prices" begin
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "GH2", "Block 1", "OnlySeason", 2020],
                    ),
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "NH3", "Block 1", "OnlySeason", 2020],
                    ),
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlySeason", 2020],
                    ),
                    1.25,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "GH2", "Block 1", "OnlySeason", 2021],
                    ),
                    0.00,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "NH3", "Block 1", "OnlySeason", 2021],
                    ),
                    1.50,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlySeason", 2021],
                    ),
                    1.5,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
