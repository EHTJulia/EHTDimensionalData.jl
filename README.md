# EHTDimensionalData
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://ehtjulia.github.io/EHTDimensionalData.jl/dev/)
[![Build Status](https://github.com/EHTJulia/EHTDimensionalData.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/EHTJulia/EHTDimensionalData.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/EHTJulia/EHTDimensionalData.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/EHTJulia/EHTDimensionalData.jl)

This package is an extension of [DimensionalData.jl](https://github.com/rafaqz/DimensionalData.jl) which provides an intuitive, self-descriptive ND-labeld data structures for Julia.
This package works as a higher layer of DimensionalData.jl by reexporting its ecosystem through [Reexport.jl](https://github.com/simonster/Reexport.jl) with a set of custom functions for DimArray and DimStack data types including potential overwrites of some methods.