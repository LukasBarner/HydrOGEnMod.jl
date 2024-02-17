function test_case_4_mcp(config)
    @testset "Test Case 4" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_4"))
        model = build_complementarity_model(data)

        status = solve_mcp(model; output = "no")

        @testset "Results" begin
            @testset "Termination Status" begin
                @test status in [:Solved]
            end
            # @testset "Objective" begin
            #     @test isapprox(objective_value.(model), 0.75, atol = config.testing_tol)
            # end
            @testset "Prices" begin
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlyTimestep", 2020],
                    ),
                    1.0,
                    atol = config.testing_tol,
                )
                @test isapprox(
                    result_value(
                        model[:π_T_to_D]["DEU", "CNG", "Block 1", "OnlyTimestep", 2021],
                    ),
                    1.0,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
