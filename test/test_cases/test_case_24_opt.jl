function test_case_24_opt(config)
    @testset "Test Case 24" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "test_24"))
        model = build_optimization_model(data)

        optimize!(
            model,
            config.optimizer,
            config.solver_options...
        )

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlySeason", 2020],
                    1.0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 2", "OnlySeason", 2020],
                    1.0,
                    atol = config.testing_tol,
                )
            end
            @testset "Objective Value" begin
                @test isapprox(objective_value(model), 0.75, atol = config.testing_tol)
            end
        end
    end
end
