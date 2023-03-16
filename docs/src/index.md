```@meta
CurrentModule = EHTDimensionalData
```

# EHTDimensionalData

[EHTDimensionalData.jl](https://github.com/EHTJulia/EHTDimensionalData.jl) is an extension of [DimensionalData.jl](https://github.com/rafaqz/DimensionalData.jl) which provides an intuitive, self-descriptive ND-labeld data structures for Julia. This package works as a higher layer of DimensionalData.jl by reexporting its ecosystem through [Reexport.jl](https://github.com/simonster/Reexport.jl) with a set of custom functions for [DimStack](https://rafaqz.github.io/DimensionalData.jl/stable/api/#Multi-array-datasets) and [DimArray](https://rafaqz.github.io/DimensionalData.jl/stable/api/#Arrays) data types including potential overwrites of some methods.


## Installation
Assuming that you already have Julia correctly installed, it suffices to import EHTUtils.jl in the standard way:

```julia
using Pkg
Pkg.add("EHTDimensionalData")
```

## Usage
As EHTDimensionalData.jl will reexport all features exporeted from DimesinalData.jl along with custom mehods, you will need to import only EHTDimensionalData.jl.

```julia
using EHTDimensionalData
```

If you need to import both DimensionalData.jl and EHTDimensionalData.jl for some reasons, please `import` or using only specific functions to avoid conflicts.

## Contents
```@contents
Pages = ["dimstack.md"]
Depth = 3
```

## Acknowledgement
The development of this package has been finantially supported by the following programs.
- [AST-2107681](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2107681), National Science Foundation, USA: v0.1.2 - present
- [AST-2034306](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2034306), National Science Foundation, USA: v0.1.2 - present
- [OMA-2029670](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2029670), National Science Foundation, USA: v0.1.2 - present
- [AST-1935980](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1935980), National Science Foundation, USA: v0.1.2 - present
- [ALMA North American Development Study Cycle 8](https://science.nrao.edu/facilities/alma/science_sustainability/alma-develop-history), National Radio Astronomy Observatory (NRAO), USA: v0.1.0 - v0.1.1

The National Radio Astronomy Observatory is a facility of the National Science Foundation operated under cooperative agreement by Associated Universities, Inc.