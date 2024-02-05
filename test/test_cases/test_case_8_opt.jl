function test_case_8_opt(config)
    @testset "Test Case 8" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_8"))
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
                    1,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value(model[:prices]["DEU", "GH2", "Block 1", "OnlySeason", 2020]),
                    2,
                    atol = config.testing_tol,
                )
            end
            @testset "Production Quantity" begin
                @test isapprox(
                    value(
                        model[:q_I]["P_DEU", "Natural Gas", "Block 1", "OnlySeason", 2020],
                    ),
                    5.0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
