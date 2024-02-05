function test_case_25_mcp(config)
    @testset "Test Case 25" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_25"))
        model = build_complementarity_model(data)

        status = solve_mcp(model; output = "no")

        @testset "Results" begin
            @testset "Termination Status" begin
                @test status in [:Solved]
            end
            @testset "Prices" begin
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlySeason", 2020],
                    ),
                    2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlySeason", 2025],
                    ),
                    1.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlySeason", 2030],
                    ),
                    0.4,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlySeason", 2035],
                    ),
                    2,
                    atol = config.testing_tol,
                )
            end
            # @testset "Objective Value" begin
            #     @test isapprox(objective_value(model), 0.45, atol = config.testing_tol)
            # end
            # @testset "Social Welfare" begin
            #     @test isapprox(
            #         objective_value(model) - sum(value.(model[:market_power_adjustment])),
            #         0.575,
            #         atol = config.testing_tol,
            #     )
            # end
        end
    end
end
