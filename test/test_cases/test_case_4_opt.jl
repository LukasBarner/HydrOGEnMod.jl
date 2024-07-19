function test_case_4_opt(config)
    @testset "Test Case 4" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_4"))
        model = build_optimization_model(data)

        optimize!(model, config.optimizer, config.solver_options...)

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Objective" begin
                @test isapprox(objective_value.(model), 0.75, atol = config.testing_tol)
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2020],
                    1.0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2021],
                    1.0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
