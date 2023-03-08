export append

"""
    append(dataset::DimStack, array::DimArray)

Append a DimArray data into the given DimStack data set.
"""
function append(ds::DimStack, array::DimArray)
    name = array.name
    key_list = keys(ds)
    outds = DimStack(
        [ds[key] for key in key_list if key != name]...,
        array
    )
    return outds
end

"""
    Base.append!(dataset::DimStack, array::DimArray)

Append a DimArray data into the given DimStack data set.
"""
function Base.append!(ds::DimStack, array::DimArray)
    ds = append(ds, array)
end