function test_case_1_opt(config)
    @testset "Test Case 1" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_1"))
        model = build_optimization_model(data)

        optimize!(model, config.optimizer, config.solver_options...)

        @testset "Results" begin
            @testset "Termination Status" begin
                @test termination_status(model) in
                      [ALMOST_LOCALLY_SOLVED, LOCALLY_SOLVED, OPTIMAL]
            end
            @testset "Prices" begin
                @test isapprox(
                    value.(model[:prices])["DEU", "CNG", "Block 1", "OnlyTimestep", 2020],
                    1.5,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
