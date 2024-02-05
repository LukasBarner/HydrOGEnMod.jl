function functional_test_2(config)
    @testset "Functional Test 2" begin

        data = get_HydrOGEnMod_data(; data = joinpath(@__DIR__, "functional_test_2"))
        writedir = mktempdir()
        write_csv(writedir, data)

        @test isfile(joinpath(writedir, "c_Pl.csv"))
        @test isfile(joinpath(writedir, "c_Pq.csv"))
        @test isfile(joinpath(writedir, "av_I.csv"))
        @test isfile(joinpath(writedir, "Λ_I.csv"))
        @test isfile(joinpath(writedir, "Ω_I.csv"))
        @test isfile(joinpath(writedir, "c_Δ_I.csv"))
        @test isfile(joinpath(writedir, "L_I.csv"))

        @test isfile(joinpath(writedir, "Λ_P.csv"))
        @test isfile(joinpath(writedir, "c_P.csv"))
        @test isfile(joinpath(writedir, "Ω_P.csv"))
        @test isfile(joinpath(writedir, "c_Δ_P.csv"))
        @test isfile(joinpath(writedir, "L_P.csv"))
        @test isfile(joinpath(writedir, "fi_P.csv"))

        @test isfile(joinpath(writedir, "NC.csv"))
        @test isfile(joinpath(writedir, "Λ_T.csv"))

        @test isfile(joinpath(writedir, "Λ_V.csv"))
        @test isfile(joinpath(writedir, "c_V.csv"))
        @test isfile(joinpath(writedir, "c_Δ_V.csv"))
        @test isfile(joinpath(writedir, "c_Δ_RV.csv"))
        @test isfile(joinpath(writedir, "L_V.csv"))
        @test isfile(joinpath(writedir, "fi_V.csv"))

        @test isfile(joinpath(writedir, "c_A.csv"))
        @test isfile(joinpath(writedir, "c_Δ_A.csv"))
        @test isfile(joinpath(writedir, "c_Δ_RA.csv"))
        @test isfile(joinpath(writedir, "Λ_A.csv"))
        @test isfile(joinpath(writedir, "l_a_loss.csv"))
        @test isfile(joinpath(writedir, "L_A_life.csv"))

        @test isfile(joinpath(writedir, "Λ_S.csv"))
        @test isfile(joinpath(writedir, "c_S_in.csv"))
        @test isfile(joinpath(writedir, "c_S_out.csv"))
        @test isfile(joinpath(writedir, "c_Δ_S.csv"))
        @test isfile(joinpath(writedir, "c_Δ_RS.csv"))
        @test isfile(joinpath(writedir, "l_s_loss.csv"))
        @test isfile(joinpath(writedir, "L_S_life.csv"))
        @test isfile(joinpath(writedir, "Ω_S.csv"))

        @test isfile(joinpath(writedir, "α_D.csv"))
        @test isfile(joinpath(writedir, "β_D.csv"))

    end
end
