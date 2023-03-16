# Overwrite the getindex function for DimStack.
function Base.getindex(
    ds::DimStack,
    idx::Union{Int,Colon,AbstractRange,AbstractArray,Tuple}...
)
    dim_names = name.(dims(ds))
    ndim = length(dim_names)
    nlist = size(ds)

    if length(idx) > ndim
        @throwerror ValueError "The number of indexes is larger than the number of dimensions."
    end

    idx_list = Vector{Any}()
    for i in 1:ndim
        if i <= length(idx)
            if isa(idx[i], Int)
                push!(idx_list, idx[i]:idx[i])
            else
                push!(idx_list, idx[i])
            end
        else
            push!(idx_list, Colon())
        end
    end

    ds_list = OrderedDict()
    for key in keys(ds)
        dadim_names = name.(dims(ds[key]))
        ndadim = length(dadim_names)

        selidx_list = Vector{Any}()
        for i in 1:ndadim
            dimidx = findfirst(dim_names .== dadim_names[i])
            push!(selidx_list, idx_list[dimidx])
        end
        if length(selidx_list) > 0
            ds_list[key] = ds[key][selidx_list...]
        else
            ds_list[key] = ds[key]
        end
    end

    newds = DimStack(
        NamedTuple(ds_list),
        metadata=DimensionalData.Dimensions.LookupArrays.metadata(ds)
    )

    return newds
end
