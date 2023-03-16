# Custom Methods for `DimStack`
The package provides and aims to implement custom methods to handle the `DimStack` data type originally in [DimensionalData.jl](https://github.com/rafaqz/DimensionalData.jl).

## Data Selection
The package partially overwrites the getindex method for the `DimStack` data type. Supposed that you have the following `visds::DimStack` data, which is a radio-astronomy interferometric data set loaded by [EHTUVData.jl](https://github.com/EHTJulia/EHTUVData.jl).
```julia
julia> visds
DimStack with dimensions: 
  Dim{:ch} Sampled{Int64} Int64[1] ForwardOrdered Irregular Points,
  Dim{:spw} Sampled{Int64} Int64[1, 2, 3, 4] ForwardOrdered Irregular Points,
  Dim{:data} Sampled{Int64} Int64[1, 2, …, 55997, 55998] ForwardOrdered Irregular Points,
  Dim{:pol} Sampled{Int64} Int64[1, 2, 3, 4] ForwardOrdered Irregular Points
and 20 layers:
  :visibility   ComplexF64 dims: Dim{:ch}, Dim{:spw}, Dim{:data}, Dim{:pol} (1×4×55998×4)
  :sigma        Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data}, Dim{:pol} (1×4×55998×4)
  :flag         Int8 dims: Dim{:ch}, Dim{:spw}, Dim{:data}, Dim{:pol} (1×4×55998×4)
  :polarization String dims: Dim{:pol} (4)
  :usec         Float64 dims: Dim{:data} (55998)
  :vsec         Float64 dims: Dim{:data} (55998)
  :wsec         Float64 dims: Dim{:data} (55998)
  :mjd          Float64 dims: Dim{:data} (55998)
  :Δmjd         Float64 dims: Dim{:data} (55998)
  :antid1       Int64 dims: Dim{:data} (55998)
  :antid2       Int64 dims: Dim{:data} (55998)
  :scan         Int64 dims: Dim{:data} (55998)
  :νspw         Float64 dims: Dim{:spw} (4)
  :Δνch         Float64 dims: Dim{:spw} (4)
  :sideband     Float64 dims: Dim{:spw} (4)
  :ν            Float64 dims: Dim{:ch}, Dim{:spw} (1×4)
  :u            Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×4×55998)
  :v            Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×4×55998)
  :w            Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×4×55998)
  :uvdist       Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×4×55998)
```
We keep most of the getindex methods from [DimensionalData.jl](https://github.com/rafaqz/DimensionalData.jl), for instance, you can select a specific `DimArray` in the `DimStack` data set by using a `key::Symbol`.
```julia
julia> # selecting `:u` array
julia> u = visds[:u]
1×4×55998 DimArray{Float64,3} u with dimensions: 
  Dim{:ch} Sampled{Int64} Int64[1] ForwardOrdered Irregular Points,
  Dim{:spw} Sampled{Int64} Int64[1, 2, 3, 4] ForwardOrdered Irregular Points,
  Dim{:data} Sampled{Int64} Int64[1, 2, …, 55997, 55998] ForwardOrdered Irregular Points
[:, :, 1]
         1         2     3           4
 1  -96856.7  -97414.4  -1.00311e5  -1.00886e5
[and 55997 more slices...]

julia> # This is not a deepcopy. The slice is programmatically indistinguishable from the original data.
julia> u === visds[:u]
true
```
This package provides a custom getindex function for the array-index-based data selection useful for slicing. For instance, this visds data set has the following dimensions.
```julia
julia> dims(visds)
Dim{:ch} Sampled{Int64} Int64[1] ForwardOrdered Irregular Points,
Dim{:spw} Sampled{Int64} Int64[1, 2, 3, 4] ForwardOrdered Irregular Points,
Dim{:data} Sampled{Int64} Int64[1, 2, …, 55997, 55998] ForwardOrdered Irregular Points,
Dim{:pol} Sampled{Int64} Int64[1, 2, 3, 4] ForwardOrdered Irregular Points
```
We might want to select data at a specific set of `:spw`, `:polarization` and `:data` columns. This package allows an intuitive data selection similar to python's [xarray](https://docs.xarray.dev/en/stable/) data set, for instance,
```julia
julia> # slicing at :spw = 4, :data=100:10000, :polarization = 2
julia> slice = visds[:, 4, 100:10000, 2]
DimStack with dimensions: 
  Dim{:ch} Sampled{Int64} Int64[1] ForwardOrdered Irregular Points,
  Dim{:spw} Sampled{Int64} Int64[4] ForwardOrdered Irregular Points,
  Dim{:data} Sampled{Int64} Int64[100, 101, …, 9999, 10000] ForwardOrdered Irregular Points,
  Dim{:pol} Sampled{Int64} Int64[2] ForwardOrdered Irregular Points
and 20 layers:
  :visibility   ComplexF64 dims: Dim{:ch}, Dim{:spw}, Dim{:data}, Dim{:pol} (1×1×9901×1)
  :sigma        Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data}, Dim{:pol} (1×1×9901×1)
  :flag         Int8 dims: Dim{:ch}, Dim{:spw}, Dim{:data}, Dim{:pol} (1×1×9901×1)
  :polarization String dims: Dim{:pol} (1)
  :usec         Float64 dims: Dim{:data} (9901)
  :vsec         Float64 dims: Dim{:data} (9901)
  :wsec         Float64 dims: Dim{:data} (9901)
  :mjd          Float64 dims: Dim{:data} (9901)
  :Δmjd         Float64 dims: Dim{:data} (9901)
  :antid1       Int64 dims: Dim{:data} (9901)
  :antid2       Int64 dims: Dim{:data} (9901)
  :scan         Int64 dims: Dim{:data} (9901)
  :νspw         Float64 dims: Dim{:spw} (1)
  :Δνch         Float64 dims: Dim{:spw} (1)
  :sideband     Float64 dims: Dim{:spw} (1)
  :ν            Float64 dims: Dim{:ch}, Dim{:spw} (1×1)
  :u            Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×1×9901)
  :v            Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×1×9901)
  :w            Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×1×9901)
  :uvdist       Float64 dims: Dim{:ch}, Dim{:spw}, Dim{:data} (1×1×9901)
```
This will give a complete set of the slice. In the original DimensionalData, this sort of slicing is not generally allowed. Note that the index-based slice of `DimStack` is all deepcopy and programmatically distinguishable. This is coming from the nature of the original getindex function for `DimArray` in DimensionalData.jl.
```julia
julia> # slice is a deep copy of the original array data
julia> slice[:visibility].data === visds[:visibility].data[:, 4, 100:10000, 2]
false
julia> slice[:visibility].data == visds[:visibility].data[:, 4, 100:10000, 2]
true
```

## Append a `DimArray` to a `DimStack`
The package provides the `append` method to add a `DimArray` to the given `DimStack` data set.
```@docs
append(ds::DimStack, array::DimArray)
```

## Concatenate two `DimStack`s 
The package provides the `concat` method to concatenate two `DimStack` data sets.
```@docs
concat(dataset1::DimStack, dataset2::DimStack)
```