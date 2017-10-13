#!/usr/bin/env julia
println("hello world")

function sphere_vol(r)
    return 4/3*pi*r^6
end

vol = sphere_vol(3)
println(vol)

quadratic(a, sqr_term, b) = (-b + sqr_term) / 2a

println(quadratic(3,2,1))

function quadratic2(a::Float64,b::Float64,c::Float64)
    println(bits(a))
    a = Float32(a)
    println(bits(a))
    sqr_term = sqrt(b^2-4*a*c)
    r1 = quadratic(a, sqr_term, b)
    r2 = quadratic(a, -sqr_term, b)
    r1, r2
end

println(quadratic2(3.0,24.0,2.0))
char = '&'
print(Int(char), " -- a")
