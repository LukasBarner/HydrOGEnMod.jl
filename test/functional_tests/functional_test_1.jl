function functional_test_1(config)
    @testset "Functional Test 1" begin

        data = get_HydrOGEnMod_data(joinpath(@__DIR__, "functional_test_1"))

        @testset "Production Costs" begin
            @test isapprox(
                data.production_data.c_P["P_DEU", :, :, :].data,
                2 * data.production_data.c_P["P_NLD", :, :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.production_data.c_P["P_DEU", :, :, :].data .!= 0)
        end

        @testset "Production Expansion Costs" begin
            @test isapprox(
                data.production_data.c_Δ_P["P_DEU", :, :, :].data,
                2 * data.production_data.c_Δ_P["P_NLD", :, :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.production_data.c_Δ_P["P_DEU", :, :, :].data .!= 0)
        end

        @testset "Conversion Costs" begin
            @test isapprox(
                data.conversion_data.c_V["V_DEU", :, :, :].data,
                2 * data.conversion_data.c_V["V_NLD", :, :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.conversion_data.c_V["V_DEU", :, :, :].data .!= 0)
        end

        @testset "Conversion Expansion Costs" begin
            @test isapprox(
                data.conversion_data.c_Δ_V["V_DEU", :, :, :].data,
                2 * data.conversion_data.c_Δ_V["V_NLD", :, :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.conversion_data.c_Δ_V["V_DEU", :, :, :].data .!= 0)
        end

        @testset "Conversion Repurposing Costs" begin
            @test isapprox(
                data.conversion_data.c_Δ_RV["V_DEU", :, :, :, :, :].data,
                2 * data.conversion_data.c_Δ_RV["V_NLD", :, :, :, :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.conversion_data.c_Δ_RV["V_DEU", :, :, :, :, :].data .!= 0)
        end

        @testset "Storage Injection Costs" begin
            @test isapprox(
                data.storage_data.c_S_in["S_DEU", :, :].data,
                2 * data.storage_data.c_S_in["S_NLD", :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.storage_data.c_S_in["S_DEU", :, :].data .!= 0)
        end

        @testset "Storage Extraction Costs" begin
            @test isapprox(
                data.storage_data.c_S_out["S_DEU", :, :].data,
                2 * data.storage_data.c_S_out["S_NLD", :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.storage_data.c_S_out["S_DEU", :, :].data .!= 0)
        end

        @testset "Storage Expansion Costs" begin
            @test isapprox(
                data.storage_data.c_Δ_S["S_DEU", :, :].data,
                2 * data.storage_data.c_Δ_S["S_NLD", :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.storage_data.c_Δ_S["S_DEU", :, :].data .!= 0)
        end

        @testset "Storage Repurposing Costs" begin
            @test isapprox(
                data.storage_data.c_Δ_RS["S_DEU", :, :, :].data,
                2 * data.storage_data.c_Δ_RS["S_NLD", :, :, :].data,
                atol = config.testing_tol,
            )
            @test any(data.storage_data.c_Δ_RS["S_DEU", :, :, :].data .!= 0)
        end

        @testset "Arc Operational Costs" begin
            @test isapprox(
                data.arc_data.c_A["NLD_to_DEU", :, :].data,
                [
                    0.025 0.025 0.025
                    0.025 0.025 0.025
                ],
                atol = config.testing_tol,
            )
        end

        @testset "Arc Investment Costs" begin
            @test isapprox(
                data.arc_data.c_Δ_A["NLD_to_DEU", :, :].data,
                [
                    0.125 0.125 0.125
                    0.125 0.125 0.125
                ],
                atol = config.testing_tol,
            )
        end

        @testset "Arc Repurposing Costs" begin
            @test isapprox(
                data.arc_data.c_Δ_RA["NLD_to_DEU", "CNG", "GH2", :].data,
                [6, 7, 8] / 2,
                atol = config.testing_tol,
            )
        end

        @testset "Specific Market Power" begin
            @test isapprox(
                data.trade_data.NC["T_NLD", "NLD", "CNG"],
                0.5,
                atol = config.testing_tol,
            )
            @test isapprox(
                data.trade_data.NC["T_NLD", "DEU", "CNG"],
                0.75,
                atol = config.testing_tol,
            )
            @test isapprox(
                data.trade_data.NC["T_DEU", "DEU", "CNG"],
                0,
                atol = config.testing_tol,
            )
            @test isapprox(
                data.trade_data.NC["T_DEU", "NLD", "CNG"],
                1,
                atol = config.testing_tol,
            )
            @test isapprox(
                data.trade_data.NC["T_NLD", "NLD", "GH2"],
                0,
                atol = config.testing_tol,
            )
            @test isapprox(
                data.trade_data.NC["T_NLD", "DEU", "GH2"],
                1,
                atol = config.testing_tol,
            )
            @test isapprox(
                data.trade_data.NC["T_DEU", "DEU", "GH2"],
                0,
                atol = config.testing_tol,
            )
            @test isapprox(
                data.trade_data.NC["T_DEU", "NLD", "GH2"],
                1,
                atol = config.testing_tol,
            )
        end

    end
end
