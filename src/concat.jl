export concat

"""
    concat(dataset1::DimStack, dataset2::DimStack)::DimStack

Concatanate two DimStack data sets. If keys are duplicated, dimarrays of dataset1 will be
overwritten. `DimArray`s in the concatenated `DimStack` data set are programmatically
indistinguishable from those in the original `DimStack` data sets.
"""
function concat(dataset1::DimStack, dataset2::DimStack)::DimStack
    keys1 = keys(dataset1)
    keys2 = keys(dataset2)
    ds = DimStack(
        [dataset1[key] for key in keys1 if key ∉ keys2]...,
        [dataset2[key] for key in keys2]...,
    )
    return ds
end
