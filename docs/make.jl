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
                "Test Case 2" => "tests/test_cases/test_case_2.md",
                "Test Case 3" => "tests/test_cases/test_case_3.md",
                "Test Case 4" => "tests/test_cases/test_case_4.md",
                "Test Case 5" => "tests/test_cases/test_case_5.md",
                "Test Case 6" => "tests/test_cases/test_case_6.md",
                "Test Case 7" => "tests/test_cases/test_case_7.md",
                "Test Case 8" => "tests/test_cases/test_case_8.md",
                "Test Case 9" => "tests/test_cases/test_case_9.md",
                "Test Case 10" => "tests/test_cases/test_case_10.md",
                "Test Case 11" => "tests/test_cases/test_case_11.md",
                "Test Case 12" => "tests/test_cases/test_case_12.md",
                "Test Case 13" => "tests/test_cases/test_case_13.md",
                "Test Case 14" => "tests/test_cases/test_case_14.md",
                "Test Case 15" => "tests/test_cases/test_case_15.md",
                "Test Case 16" => "tests/test_cases/test_case_16.md",
                "Test Case 17" => "tests/test_cases/test_case_17.md",
                "Test Case 18" => "tests/test_cases/test_case_18.md",
                "Test Case 19" => "tests/test_cases/test_case_19.md",
                "Test Case 20" => "tests/test_cases/test_case_20.md",
                "Test Case 21" => "tests/test_cases/test_case_21.md",
                "Test Case 22" => "tests/test_cases/test_case_22.md",
                "Test Case 23" => "tests/test_cases/test_case_23.md",
                "Test Case 24" => "tests/test_cases/test_case_24.md",
                "Test Case 25" => "tests/test_cases/test_case_25.md",
                "Test Case 26" => "tests/test_cases/test_case_26.md",
                "Test Case 27" => "tests/test_cases/test_case_27.md",
                "Test Case 28" => "tests/test_cases/test_case_28.md",
            ], 
            "Functional Tests" => [
                "Functional Test 1" => "tests/functional_tests/functional_test_1.md",
                "Functional Test 2" => "tests/functional_tests/functional_test_2.md",
                "Functional Test 3" => "tests/functional_tests/functional_test_3.md",
                "Functional Test 4" => "tests/functional_tests/functional_test_4.md",
                "Functional Test 5" => "tests/functional_tests/functional_test_5.md",
            ]
        ],
        "Replication" => "replication.md",
    ],
)

deploydocs(;
    repo="github.com/LukasBarner/HydrOGEnMod.jl",
    devbranch="main",
)
