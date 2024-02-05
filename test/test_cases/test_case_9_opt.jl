function test_case_9_opt(config)
    @testset "Test Case 9a (pipeline)" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "test_9a"))
        model = build_optimization_model(data)

        optimize!(
            model,
            config.optimizer,
            config.solver_options...,
        )

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value(model[:prices]["DEU", "CNG", "Block 1", "OnlySeason", 2020]),
                    1.2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "CNG", "Block 1", "OnlySeason", 2020]),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
                @test isapprox(
                    value(
                        model[:q_I]["P_DEU", "Natural Gas", "Block 1", "OnlySeason", 2020],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(
                        model[:q_I]["P_NLD", "Natural Gas", "Block 1", "OnlySeason", 2020],
                    ),
                    0.88,
                    atol = config.testing_tol,
                )
            end
        end
    end

    @testset "Test Case 9b (shipping)" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "test_9b"))
        model = build_optimization_model(data)

        @testset "Shipping Capacity BIG" begin
            @test all(isapprox.(data.arc_data.Λ_A.data, 1e+6, atol = config.testing_tol))
        end

        optimize!(
            model,
            config.optimizer,
            config.solver_options...,
        )

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value(model[:prices]["DEU", "CNG", "Block 1", "OnlySeason", 2020]),
                    1.2,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["NLD", "CNG", "Block 1", "OnlySeason", 2020]),
                    0,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantities" begin
                @test isapprox(
                    value(
                        model[:q_I]["P_DEU", "Natural Gas", "Block 1", "OnlySeason", 2020],
                    ),
                    0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(
                        model[:q_I]["P_NLD", "Natural Gas", "Block 1", "OnlySeason", 2020],
                    ),
                    0.88,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
