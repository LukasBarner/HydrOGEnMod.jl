function test_case_28_opt(config)
    @testset "Test Case 28a (pipeline)" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_28a"))
        model = build_optimization_model(data)

        optimize!(model, config.optimizer, config.solver_options...)

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value(model[:prices]["DEU", "CNG", "Block 1", "OnlyTimestep", 2020]),
                    2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "CNG", "Block 1", "OnlyTimestep", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["DEU", "CNG", "Block 1", "OnlyTimestep", 2021]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "CNG", "Block 1", "OnlyTimestep", 2021]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["DEU", "GH2", "Block 1", "OnlyTimestep", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "GH2", "Block 1", "OnlyTimestep", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["DEU", "GH2", "Block 1", "OnlyTimestep", 2021]),
                    2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "GH2", "Block 1", "OnlyTimestep", 2021]),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
                @test isapprox(
                    value(
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
                    value(
                        model[:q_I][
                            "P_NLD",
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
                    value(
                        model[:q_I][
                            "P_DEU",
                            "Natural Gas",
                            "Block 1",
                            "OnlyTimestep",
                            2021,
                        ],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(
                        model[:q_I][
                            "P_NLD",
                            "Natural Gas",
                            "Block 1",
                            "OnlyTimestep",
                            2021,
                        ],
                    ),
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end

    @testset "Test Case 28b (shipping)" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_28b"))
        model = build_optimization_model(data)

        optimize!(model, config.optimizer, config.solver_options...)

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value(model[:prices]["DEU", "CNG", "Block 1", "OnlyTimestep", 2020]),
                    2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "CNG", "Block 1", "OnlyTimestep", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["DEU", "CNG", "Block 1", "OnlyTimestep", 2021]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "CNG", "Block 1", "OnlyTimestep", 2021]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["DEU", "GH2", "Block 1", "OnlyTimestep", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "GH2", "Block 1", "OnlyTimestep", 2020]),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["DEU", "GH2", "Block 1", "OnlyTimestep", 2021]),
                    2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "GH2", "Block 1", "OnlyTimestep", 2021]),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
                @test isapprox(
                    value(
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
                    value(
                        model[:q_I][
                            "P_NLD",
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
                    value(
                        model[:q_I][
                            "P_DEU",
                            "Natural Gas",
                            "Block 1",
                            "OnlyTimestep",
                            2021,
                        ],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(
                        model[:q_I][
                            "P_NLD",
                            "Natural Gas",
                            "Block 1",
                            "OnlyTimestep",
                            2021,
                        ],
                    ),
                    0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
