export concat
export concat!

"""
    concat(dataset1::DimStack, dataset2::DimStack)

Concatanate two DimStack data sets. If keys are duplicated, dimarrays of dataset1
will be overwritten.
"""
function concat(dataset1::DimStack, dataset2::DimStack)
    keys1 = keys(dataset1)
    keys2 = keys(dataset2)
    ds = DimStack(
        [dataset1[key] for key in keys1 if key ∉ keys2]...,
        [dataset2[key] for key in keys2]...,
    )
    return ds
end

"""
    concat!(dataset1::DimStack, dataset2::DimStack)

Concatanate two DimStack data sets. If keys are duplicated, dimarrays of dataset1
will be overwritten.
"""
function concat!(dataset1::DimStack, dataset2::DimStack)
    dataset1 = concat(dataset1, dataset2)
end