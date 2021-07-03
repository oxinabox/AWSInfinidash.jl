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
#TODO This should just be `const I8h = @service Infinidash` but that doesn't support
# checking if AWS.jl has support for it. So we unwreap the macro by hand.
function __init__()
    service_path = joinpath(dirname(Base.find_package("AWS")), "services", "infinidash.jl")
    if isfile(service_path)
        include(service_path)
    else
        @warn "SDK for Infinidash not found. Is your version of AWS.jl up to date? Functionality may be limitted."
        @eval I8h = Module(:Infinidash)
    end
end

# Very High level API
# TODO implement a more idiomatic julia interface over the SDK methods

end  # module

