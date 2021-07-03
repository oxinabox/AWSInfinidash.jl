# AWSInfinidash

[![Build Status](https://github.com/oxinabox/AWSInfinidash.jl/workflows/CI/badge.svg)](https://github.com/oxinabox/AWSInfinidash.jl/actions)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)

AWS Infinidash Interface for Julia.

This package wraps up the standard Infinidash SDK from [AWS.jl](https://github.com/JuliaCloud/AWS.jl) in to a more idiomatic Julia interface.

Right now it is still very bare bones.
**PRs welcome!**

## Demo
```julia
julia> using AWSInfinidash

julia> i8h
#1 (generic function with 1 method)

julia> I8h
Main.Infinidash
```

## Planned Features
 - Compostable pipelines
 - Combine all the `foo_x`, `foo_y`, `foo_z` methods into one `foo(t, ...)` function with multiple dispatch.
 - Docs.

