function test_case_22_mcp(config)
    @testset "Test Case 22" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "test_22"))
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
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "H", 2020]),
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "L", 2021]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "CNG", "Block 1", "H", 2021]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "GH2", "Block 1", "L", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "GH2", "Block 1", "H", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "GH2", "Block 1", "L", 2021]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(model[:π_T_to_D]["DEU", "GH2", "Block 1", "H", 2021]),
                    1,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
                @test isapprox(
                    result_value.(model[:q_I])[
                        "P_DEU",
                        "Natural Gas",
                        "Block 1",
                        "L",
                        2020,
                    ],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:q_I])[
                        "P_DEU",
                        "Natural Gas",
                        "Block 1",
                        "H",
                        2020,
                    ],
                    0.0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:q_I])[
                        "P_DEU",
                        "Natural Gas",
                        "Block 1",
                        "L",
                        2021,
                    ],
                    0.5,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value.(model[:q_I])[
                        "P_DEU",
                        "Natural Gas",
                        "Block 1",
                        "H",
                        2021,
                    ],
                    0.0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
