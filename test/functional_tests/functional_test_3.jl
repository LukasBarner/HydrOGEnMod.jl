function functional_test_3(config)
    @testset "Functional Test 3" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "functional_test_3"))
        writedir = mktempdir()
        vardir = joinpath(writedir, "variables")
        exdir = joinpath(writedir, "expressions")

        model = build_optimization_model(data)
        optimize!(
            model,
            Ipopt.Optimizer,
            config.solver_options...,
        )
        write_csv(writedir, model)

        @testset "Variables" begin
            @test isfile(joinpath(vardir, "q_I.csv"))
            @test isfile(joinpath(vardir, "q_P_T.csv"))
            @test isfile(joinpath(vardir, "Δ_I.csv"))
            @test isfile(joinpath(vardir, "Δ_P.csv"))
            @test isfile(joinpath(vardir, "q_T_D.csv"))
            @test isfile(joinpath(vardir, "q_V.csv"))
            @test isfile(joinpath(vardir, "Δ_V.csv"))
            @test isfile(joinpath(vardir, "Δ_RV.csv"))
            @test isfile(joinpath(vardir, "q_T.csv"))
            @test isfile(joinpath(vardir, "Δ_A.csv"))
            @test isfile(joinpath(vardir, "Δ_RA.csv"))
            @test isfile(joinpath(vardir, "q_S.csv"))
            @test isfile(joinpath(vardir, "q_S_in.csv"))
            @test isfile(joinpath(vardir, "q_S_out.csv"))
            @test isfile(joinpath(vardir, "Δ_S.csv"))
            @test isfile(joinpath(vardir, "Δ_RS.csv"))
        end

        @testset "Expressions" begin

            @test isfile(joinpath(exdir, "demand.csv"))
            @test isfile(joinpath(exdir, "yearly_demand.csv"))
            @test isfile(joinpath(exdir, "yearly_production.csv"))
            @test isfile(joinpath(exdir, "yearly_arc_flows.csv"))
            @test isfile(joinpath(exdir, "yearly_input_procurement.csv"))

            @test isfile(joinpath(exdir, "prices.csv"))

            @test isfile(joinpath(exdir, "gross_surplus.csv"))

            @test isfile(joinpath(exdir, "market_power_adjustment.csv"))

            @test isfile(joinpath(exdir, "input_cost.csv"))
            @test isfile(joinpath(exdir, "input_expansion_cost.csv"))

            @test isfile(joinpath(exdir, "production_cost.csv"))
            @test isfile(joinpath(exdir, "production_expansion_cost.csv"))

            @test isfile(joinpath(exdir, "conversion_cost.csv"))
            @test isfile(joinpath(exdir, "conversion_expansion_cost.csv"))
            @test isfile(joinpath(exdir, "conversion_repurposing_cost.csv"))

            @test isfile(joinpath(exdir, "transport_cost.csv"))
            @test isfile(joinpath(exdir, "transport_expansion_cost.csv"))
            @test isfile(joinpath(exdir, "transport_repurposing_cost.csv"))

            @test isfile(joinpath(exdir, "storage_cost.csv"))
            @test isfile(joinpath(exdir, "storage_expansion_cost.csv"))
            @test isfile(joinpath(exdir, "storage_repurposing_cost.csv"))

        end

    end
end
