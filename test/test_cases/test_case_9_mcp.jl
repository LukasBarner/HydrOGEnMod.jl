function test_case_9_mcp(config)
    @testset "Test Case 9a (pipeline)" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_9a"))
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
                    1.2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["NLD", "CNG", "Block 1", "OnlyTimestep", 2020],
                    ),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
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
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:q_I][
                            "P_NLD",
                            "Natural Gas",
                            "Block 1",
                            "OnlyTimestep",
                            2020,
                        ],
                    ),
                    0.88,
                    atol = config.testing_tol,
                )
            end
        end
    end

    @testset "Test Case 9b (shipping)" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_9b"))
        model = build_complementarity_model(data)

        @testset "Shipping Capacity BIG" begin
            @test all(isapprox.(data.arc_data.Λ_A.data, 1e+6, atol = config.testing_tol))
        end

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
                    1.2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["NLD", "CNG", "Block 1", "OnlyTimestep", 2020],
                    ),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
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
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:q_I][
                            "P_NLD",
                            "Natural Gas",
                            "Block 1",
                            "OnlyTimestep",
                            2020,
                        ],
                    ),
                    0.88,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
