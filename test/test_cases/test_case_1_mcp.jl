function test_case_1_mcp(config)
    @testset "Test Case 1" begin
        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "test_1"))
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
                    1.5,
                    atol = config.testing_tol,
                )
            end
        end
    end
end
