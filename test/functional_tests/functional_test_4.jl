function functional_test_4(config)
    @testset "Functional Test 4" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "functional_test_4"))
        writedir = mktempdir()
        vardir = joinpath(writedir, "variables")

        model = build_complementarity_model(data)

        if haskey(ENV, "PATH_LICENSE_STRING")
            status = solve_mcp(model; output = "no", time_limit = 5)
        else
            mcp_data = Complementarity.get_MCP_data(model)
            for i = 1:length(mcp_data)
                Complementarity.set_result_value(mcp_data[i], 0.0)
            end
        end

        write_csv(writedir, model)

        @testset "Variables" begin
            @test isfile(joinpath(vardir, "q_I.csv"))
            @test isfile(joinpath(vardir, "q_P_to_T.csv"))
            @test isfile(joinpath(vardir, "Δ_I.csv"))
            @test isfile(joinpath(vardir, "Δ_P.csv"))
            @test isfile(joinpath(vardir, "ϕ_P.csv"))
            @test isfile(joinpath(vardir, "λ_I.csv"))
            @test isfile(joinpath(vardir, "λ_P.csv"))
            @test isfile(joinpath(vardir, "ω_P.csv"))
            @test isfile(joinpath(vardir, "ω_I.csv"))
            @test isfile(joinpath(vardir, "q_T_to_D.csv"))
            @test isfile(joinpath(vardir, "q_T_from_P.csv"))
            @test isfile(joinpath(vardir, "q_T_to_V.csv"))
            @test isfile(joinpath(vardir, "q_T_from_V.csv"))
            @test isfile(joinpath(vardir, "q_T_to_S.csv"))
            @test isfile(joinpath(vardir, "q_T_from_S.csv"))
            @test isfile(joinpath(vardir, "q_T.csv"))
            @test isfile(joinpath(vardir, "ϕ_T.csv"))
            @test isfile(joinpath(vardir, "λ_T.csv"))
            @test isfile(joinpath(vardir, "q_V.csv"))
            @test isfile(joinpath(vardir, "Δ_V.csv"))
            @test isfile(joinpath(vardir, "Δ_RV.csv"))
            @test isfile(joinpath(vardir, "λ_V.csv"))
            @test isfile(joinpath(vardir, "q_A.csv"))
            @test isfile(joinpath(vardir, "Δ_A.csv"))
            @test isfile(joinpath(vardir, "Δ_RA.csv"))
            @test isfile(joinpath(vardir, "λ_A.csv"))
            @test isfile(joinpath(vardir, "δ_A.csv"))
            @test isfile(joinpath(vardir, "δ_RA.csv"))
            @test isfile(joinpath(vardir, "q_S.csv"))
            @test isfile(joinpath(vardir, "q_S_in.csv"))
            @test isfile(joinpath(vardir, "q_S_out.csv"))
            @test isfile(joinpath(vardir, "Δ_S.csv"))
            @test isfile(joinpath(vardir, "Δ_RS.csv"))
            @test isfile(joinpath(vardir, "λ_S.csv"))
            @test isfile(joinpath(vardir, "ϕ_S.csv"))
            @test isfile(joinpath(vardir, "ω_S.csv"))
            @test isfile(joinpath(vardir, "π_P.csv"))
            @test isfile(joinpath(vardir, "π_T_to_D.csv"))
            @test isfile(joinpath(vardir, "π_T_to_V.csv"))
            @test isfile(joinpath(vardir, "π_V_to_T.csv"))
            @test isfile(joinpath(vardir, "π_A.csv"))
            @test isfile(joinpath(vardir, "π_T_to_S.csv"))
            @test isfile(joinpath(vardir, "π_S_to_T.csv"))

        end
    end
end
