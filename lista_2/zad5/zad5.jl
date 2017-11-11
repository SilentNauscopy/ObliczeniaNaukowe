#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#
p = Array{Float32}(41)
p[1] = Float32(0.01)
r = Float32(3)

for i in 2:41
  p[i] = Float32( p[i-1] + r *  p[i-1] * (1-p[i-1]) )
end

println(p)

#ze stopem
p[11] *= 1000
p[11] = Float32(floor(p[11])/1000)
println("---------------------------------------------")

for i in 12:41
  p[i] = Float32( p[i-1] + r *  p[i-1] * (1-p[i-1]) )
end

println(p)
