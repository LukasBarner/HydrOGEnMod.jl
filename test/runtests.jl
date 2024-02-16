using HydrOGEnMod
using Test
using Aqua
using JET
using Ipopt
using JuMP
using Makie, CairoMakie
using Complementarity
import Logging

Logging.disable_logging(Logging.LogLevel(1500))

struct TestConfig
    optimizer
    testing_tol::Float64
    solver_options
    function TestConfig(; optimizer = Ipopt.Optimizer, testing_tol = 1e-3, solver_options = ("bound_relax_factor" => 1e-8, "max_wall_time" => 100.0, "print_level" => 0))
        return new(optimizer, testing_tol, solver_options)
    end
end

@testset "HydrOGEnMod.jl" begin
    # @testset "Code quality (Aqua.jl)" begin
    #     Aqua.test_all(HydrOGEnMod)
    # end
    # @testset "Code linting (JET.jl)" begin
    #     JET.test_package(HydrOGEnMod; target_defined_modules = true)
    # end
    
    @testset "Test Cases Optimization Model" verbose = true begin
        include(joinpath("test_cases", "test_case_1_opt.jl"))
        test_case_1_opt(TestConfig())
        include(joinpath("test_cases", "test_case_2_opt.jl"))
        test_case_2_opt(TestConfig())
        include(joinpath("test_cases", "test_case_3_opt.jl"))
        test_case_3_opt(TestConfig())
        include(joinpath("test_cases", "test_case_4_opt.jl"))
        test_case_4_opt(TestConfig())
        include(joinpath("test_cases", "test_case_5_opt.jl"))
        test_case_5_opt(TestConfig())
        include(joinpath("test_cases", "test_case_6_opt.jl"))
        test_case_6_opt(TestConfig())
        include(joinpath("test_cases", "test_case_7_opt.jl"))
        test_case_7_opt(TestConfig())
        include(joinpath("test_cases", "test_case_8_opt.jl"))
        test_case_8_opt(TestConfig())
        include(joinpath("test_cases", "test_case_9_opt.jl"))
        test_case_9_opt(TestConfig())
        include(joinpath("test_cases", "test_case_10_opt.jl"))
        test_case_10_opt(TestConfig())
        include(joinpath("test_cases", "test_case_11_opt.jl"))
        test_case_11_opt(TestConfig())
        include(joinpath("test_cases", "test_case_12_opt.jl"))
        test_case_12_opt(TestConfig())
        include(joinpath("test_cases", "test_case_13_opt.jl"))
        test_case_13_opt(TestConfig())
        include(joinpath("test_cases", "test_case_14_opt.jl"))
        test_case_14_opt(TestConfig())
        include(joinpath("test_cases", "test_case_15_opt.jl"))
        test_case_15_opt(TestConfig())
        include(joinpath("test_cases", "test_case_16_opt.jl"))
        test_case_16_opt(TestConfig())
        include(joinpath("test_cases", "test_case_17_opt.jl"))
        test_case_17_opt(TestConfig())
        include(joinpath("test_cases", "test_case_18_opt.jl"))
        test_case_18_opt(TestConfig())
        include(joinpath("test_cases", "test_case_19_opt.jl"))
        test_case_19_opt(TestConfig())
        include(joinpath("test_cases", "test_case_20_opt.jl"))
        test_case_20_opt(TestConfig())
        include(joinpath("test_cases", "test_case_21_opt.jl"))
        test_case_21_opt(TestConfig())
        include(joinpath("test_cases", "test_case_22_opt.jl"))
        test_case_22_opt(TestConfig())
        include(joinpath("test_cases", "test_case_23_opt.jl"))
        test_case_23_opt(TestConfig())
        include(joinpath("test_cases", "test_case_24_opt.jl"))
        test_case_24_opt(TestConfig())
        include(joinpath("test_cases", "test_case_25_opt.jl"))
        test_case_25_opt(TestConfig())
        include(joinpath("test_cases", "test_case_26_opt.jl"))
        test_case_26_opt(TestConfig())
        include(joinpath("test_cases", "test_case_27_opt.jl"))
        test_case_27_opt(TestConfig())
        include(joinpath("test_cases", "test_case_28_opt.jl"))
        test_case_28_opt(TestConfig())
    end

    @testset "Test Cases Complementarity Model" verbose = true begin
        include(joinpath("test_cases", "test_case_1_mcp.jl"))
        test_case_1_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_2_mcp.jl"))
        test_case_2_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_3_mcp.jl"))
        test_case_3_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_4_mcp.jl"))
        test_case_4_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_5_mcp.jl"))
        test_case_5_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_6_mcp.jl"))
        test_case_6_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_7_mcp.jl"))
        test_case_7_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_8_mcp.jl"))
        test_case_8_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_9_mcp.jl"))
        test_case_9_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_10_mcp.jl"))
        test_case_10_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_11_mcp.jl"))
        test_case_11_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_12_mcp.jl"))
        test_case_12_mcp(TestConfig())
        if haskey(ENV,"PATH_LICENSE_STRING")
            include(joinpath("test_cases", "test_case_13_mcp.jl"))
            test_case_13_mcp(TestConfig())
        end
        include(joinpath("test_cases", "test_case_14_mcp.jl"))
        test_case_14_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_15_mcp.jl"))
        test_case_15_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_16_mcp.jl"))
        test_case_16_mcp(TestConfig())
        if haskey(ENV,"PATH_LICENSE_STRING")
            include(joinpath("test_cases", "test_case_17_mcp.jl"))
            test_case_17_mcp(TestConfig())
            include(joinpath("test_cases", "test_case_18_mcp.jl"))
            test_case_18_mcp(TestConfig())
        end
        include(joinpath("test_cases", "test_case_19_mcp.jl"))
        test_case_19_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_20_mcp.jl"))
        test_case_20_mcp(TestConfig())
        if haskey(ENV,"PATH_LICENSE_STRING")
            include(joinpath("test_cases", "test_case_21_mcp.jl"))
            test_case_21_mcp(TestConfig())
        end
        include(joinpath("test_cases", "test_case_22_mcp.jl"))
        test_case_22_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_23_mcp.jl"))
        test_case_23_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_24_mcp.jl"))
        test_case_24_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_25_mcp.jl"))
        test_case_25_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_26_mcp.jl"))
        test_case_26_mcp(TestConfig())
        include(joinpath("test_cases", "test_case_27_mcp.jl"))
        test_case_27_mcp(TestConfig())
        if haskey(ENV,"PATH_LICENSE_STRING")
            include(joinpath("test_cases", "test_case_28_mcp.jl"))
            test_case_28_mcp(TestConfig())
        end
    end

    @testset "Functional Tests" verbose = true begin
        include(joinpath("functional_tests", "functional_test_1.jl"))
        functional_test_1(TestConfig())
        include(joinpath("functional_tests", "functional_test_2.jl"))
        functional_test_2(TestConfig())
        include(joinpath("functional_tests", "functional_test_3.jl"))
        functional_test_3(TestConfig())
        include(joinpath("functional_tests", "functional_test_4.jl"))
        functional_test_4(TestConfig())
        include(joinpath("functional_tests", "functional_test_5.jl"))
        functional_test_5(TestConfig())
    end
end
