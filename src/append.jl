export append

"""
    append(dataset::DimStack, array::DimArray)::DimStack

Append a DimArray data into the given DimStack data set. If there is already an array with
the same key in DimStack, it will be overwritten by the array newly appended. The newly
appended `DimArray` or other `DimArray`s inherited from the `DimStack` data set are
programmatically indistinguishable from the original ones.

# Examples
```julia
julia> # suppose that you add `da::DimArray` with the name of `:newcol` into `ds::DimStack`.
julia> newds = append(ds, da)

julia> # newds is a newly formed `DimStack` because `DimStack` uses `NamedTuple｀which is immutable.
julia> newds == ds
false

julia> # The appended `DimArray` or any other `DimArray`s are programmatically indistinguishable.
julia> newds[:newcol] === da
true
julia> newds[:orgcol] === ds[:orgcol]
true
```
"""
function append(ds::DimStack, array::DimArray)::DimStack
    name = array.name
    key_list = keys(ds)
    outds = DimStack(
        [ds[key] for key in key_list if key != name]...,
        array
    )
    return outds
end
