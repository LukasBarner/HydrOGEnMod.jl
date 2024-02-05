function test_case_23_opt(config)
    @testset "Test Case 23" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "test_23"))
        model = build_optimization_model(data)

        optimize!(
            model,
            config.optimizer,
            config.solver_options...;
        )

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlySeason", 2020],
                    1.5,
                    atol = config.testing_tol,
                )
            end
            @testset "Objective Value" begin
                @test isapprox(objective_value(model), 0.45, atol = config.testing_tol)
            end
            @testset "Social Welfare" begin
                @test isapprox(
                    objective_value(model) - sum(value.(model[:market_power_adjustment])),
                    0.575,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
