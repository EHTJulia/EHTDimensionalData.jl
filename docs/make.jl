using EHTDimensionalData
using Documenter

DocMeta.setdocmeta!(EHTDimensionalData, :DocTestSetup, :(using EHTDimensionalData); recursive=true)

makedocs(;
    modules=[EHTDimensionalData],
    authors="Kazunori Akiyama",
    repo="https://github.com/EHTJulia/EHTDimensionalData.jl/blob/{commit}{path}#{line}",
    sitename="EHTDimensionalData.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://ehtjulia.github.io/EHTDimensionalData.jl",
        edit_link="main",
        assets=String[]
    ),
    pages=[
        "Home" => "index.md",
    ]
)

deploydocs(;
    repo="github.com/EHTJulia/EHTDimensionalData.jl",
    devbranch="main"
)
