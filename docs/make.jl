using HydrOGEnMod
using Documenter

DocMeta.setdocmeta!(HydrOGEnMod, :DocTestSetup, :(using HydrOGEnMod); recursive=true)

makedocs(;
    modules=[HydrOGEnMod],
    authors="Lukas Barner",
    sitename="HydrOGEnMod.jl",
    format=Documenter.HTML(;
        canonical="https://LukasBarner.github.io/HydrOGEnMod.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Mathematical Formulation" => [
            "Notation" => [
                "Sets" => "mathematical_formulation/notation/sets.md", 
                "Mappings" => "mathematical_formulation/notation/mappings.md", 
                "Primal Variables" => "mathematical_formulation/notation/primal_variables.md", 
                "Dual Variables" => "mathematical_formulation/notation/dual_variables.md", 
                "Parameters" => "mathematical_formulation/notation/parameters.md", 
            ],
            "Player Optimization Problems" => [
                "Producer Problem" => "mathematical_formulation/player_problems/producer_problem.md",
                "Trader Problem" => "mathematical_formulation/player_problems/trader_problem.md",
                "Converter Problem" => "mathematical_formulation/player_problems/converter_problem.md",
                "Transmission System Operator Problem" => "mathematical_formulation/player_problems/transmission_system_operator_problem.md",
                "Storage System Operator Problem" => "mathematical_formulation/player_problems/storage_system_operator_problem.md",
                "Market Clearing" => "mathematical_formulation/player_problems/market_clearing.md",
            ],
            "Complementarity Problem" => [
                "Producer KKTs" => "mathematical_formulation/complementarity_problem/producer_optimality_conditions.md",
                "Trader KKTs" => "mathematical_formulation/complementarity_problem/trader_optimality_conditions.md",
                "Converter KKTs" => "mathematical_formulation/complementarity_problem/converter_optimality_conditions.md",
                "Transmission System Operator KKTs" => "mathematical_formulation/complementarity_problem/transmission_system_operator_optimality_conditions.md",
                "Storage System Operator KKTs" => "mathematical_formulation/complementarity_problem/storage_system_operator_optimality_conditions.md",
                "Market Clearing" => "mathematical_formulation/complementarity_problem/market_clearing.md",
            ], 
            "Convex Reformulation" => ["Convex Optimization Problem" => "mathematical_formulation/convex_reformulation/convex_reformulation.md"]
        ],
        "API Reference" => "docstrings.md",
        "Test Case Reference" => [
            "General Remarks" => "tests/general_remarks.md", 
            "Test Cases" => [
                "Test Case 1" => "tests/test_cases/test_case_1.md",
            ], 
            "Functional Tests" => [
                "Functional Test 1" => "tests/functional_tests/functional_test_1.md",
            ]
        ],
        "Replication" => "replication.md",
    ],
)

deploydocs(;
    repo="github.com/LukasBarner/HydrOGEnMod.jl",
    devbranch="main",
)
