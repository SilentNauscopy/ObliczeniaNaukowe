#!/usr/bin/env julia
a = Float16(3)
b = Float16(4)
c = Float16(1)

macheps16 = a*(b/a-c)-c
println(macheps16," : ",eps(Float16))


a = Float32(3)
b = Float32(4)
c = Float32(1)

macheps32 = a*(b/a-c)-c
println(macheps32," : ",eps(Float32))

a = Float64(3)
b = Float64(4)
c = Float64(1)

macheps64 = a*(b/a-c)-c
println(macheps64," : ",eps(Float64))
