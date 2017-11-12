#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#

#Tablica wyników bez stopu
p = Array{Float32}(41)
#Tablica wynikóœ ze stopem
p2 = Array{Float32}(41)

#Pierwszy ustalamy
p[1] = Float32(0.01)
p2[1] = Float32(0.01)
r = Float32(3)

for i in 2:41
  p[i] = Float32( p[i-1] + r *  p[i-1] * (1-p[i-1]) )
  p2[i] = p[i]
end

#ze stopem
p2[11] *= 1000
p2[11] = Float32(floor(p2[11])/1000)
println("---------------------------------------------")

for i in 12:41
  p2[i] = Float32( p2[i-1] + r *  p2[i-1] * (1-p2[i-1]) )
end

#println(p2)
# Dla arytmetyki Float64
p3 = Array{Float64}(41)
p3[1] = Float64(0.01)
r = Float64(3)

for i in 2:41
  p3[i] = Float64( p3[i-1] + r *  p3[i-1] * (1-p3[i-1]) )
end

# WYświetlanie wyników
for i in 1:41
  println("$(i-1): $(p[i]) \t$(p2[i]) \t$(abs(p2[i]-p[i])/p[i])\t$(p3[i])")
end
