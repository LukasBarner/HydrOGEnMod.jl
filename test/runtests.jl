using HydrOGEnMod
using Test
using Aqua
using JET

@testset "HydrOGEnMod.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(HydrOGEnMod)
    end
    @testset "Code linting (JET.jl)" begin
        JET.test_package(HydrOGEnMod; target_defined_modules = true)
    end
    # Write your tests here.
end
