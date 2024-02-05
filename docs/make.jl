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
    ],
)

deploydocs(;
    repo="github.com/LukasBarner/HydrOGEnMod.jl",
    devbranch="main",
)
