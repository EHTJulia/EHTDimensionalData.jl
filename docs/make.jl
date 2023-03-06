using EHTDimensionalData
using Documenter

DocMeta.setdocmeta!(EHTDimensionalData, :DocTestSetup, :(using EHTDimensionalData); recursive=true)

makedocs(;
    modules=[EHTDimensionalData],
    authors="Kazunori Akiyama",
    repo="https://github.com/EHTDimensionalData/EHTDimensionalData.jl/blob/{commit}{path}#{line}",
    sitename="EHTDimensionalData.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://EHTDimensionalData.github.io/EHTDimensionalData.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/EHTDimensionalData/EHTDimensionalData.jl",
    devbranch="main",
)
