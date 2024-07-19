function test_case_26_opt(config)
    @testset "Test Case 26a (pipeline)" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_26a"))
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
            end
        end
    end

    @testset "Test Case 26b (shipping)" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_26b"))
        model = build_optimization_model(data)

        @testset "Shipping Capacity BIG" begin
            @test all(isapprox.(data.arc_data.Λ_A.data, 1e+6, atol = config.testing_tol))
        end

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
            end
        end
    end
end
