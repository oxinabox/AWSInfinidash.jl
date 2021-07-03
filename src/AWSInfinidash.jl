module AWSInfinidash
using AWS: AWS, @service

export I8h, i8h

# low level SDK
const i8h = try
    AWS.AWSServices.infinidash
catch err
    # defer any errors til the user time
    (args...; kwargs...) -> throw(err)
end

# High level SDK
function __init__()
    # TODO This should just be `const I8h = @service Infinidash` but that doesn't support
    # checking if AWS.jl has support for it. So we unwreap the macro by hand.
    aws_package_loc = Base.find_package("AWS")
    if aws_package_loc !== nothing
        service_path = joinpath(dirname(aws_package_loc), "services", "infinidash.jl")
        if isfile(service_path)
            include(service_path)
            return nothing  # No
        end
    end

    # Would have returned before now if it loaded successfully
    @warn "SDK for Infinidash not found. Is your version of AWS.jl up to date? Functionality may be limitted."
    @eval I8h = Module(:Infinidash)
end

# Very High level API
# TODO implement a more idiomatic julia interface over the SDK methods

end  # module

