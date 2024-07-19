function test_case_8_mcp(config)
    @testset "Test Case 8" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_8"))
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
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "GH2", "Block 1", "OnlyTimestep", 2020],
                    ),
                    2,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantity" begin
                @test isapprox(
                    result_value(
                        model[:q_I][
                            "P_DEU",
                            "Natural Gas",
                            "Block 1",
                            "OnlyTimestep",
                            2020,
                        ],
                    ),
                    5.0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
