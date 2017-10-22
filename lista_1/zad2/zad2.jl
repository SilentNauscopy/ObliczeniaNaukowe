#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#

# zmienne w określonym typie aby uniknąć konwersji
a = Float16(3)
b = Float16(4)
c = Float16(1)

#obliczanie wyrażenie Kahan'a
macheps16 = a*(b/a-c)-c

#wyświetlenie wyników
println(typeof(a))
println("Kahan: ",macheps16," | eps(): ",eps(Float16))
println("Kahan: ",bits(macheps16)," | eps(): ",bits(eps(Float16)))

#Poniżej znajdują się te same operacje dla innych typów

#typ float32
a = Float32(3)
b = Float32(4)
c = Float32(1)

macheps32 = a*(b/a-c)-c
println(typeof(a))
println("Kahan: ",macheps32," | eps(): ",eps(Float32))
println("Kahan: ",bits(macheps32)," | eps(): ",bits(eps(Float32)))

#typ float64
a = Float64(3)
b = Float64(4)
c = Float64(1)

macheps64 = a*(b/a-c)-c
println(typeof(a))
println("Kahan: ",macheps64," | eps(): ",eps(Float64))
println("Kahan: ",bits(macheps64)," | eps(): ",bits(eps(Float64)))
