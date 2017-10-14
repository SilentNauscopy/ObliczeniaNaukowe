#!/usr/bin/env julia
# skorzystać z funkcji bits
# przediał [1,2]
# d = 2^-52

a = Float64(1)
b = Float64(2)
println(bits(a))
# 01111111111 == 1023 czyli cecha wynosi 2^(1023 - 1023)= 2^0
# domyślnie jest 1 której nie wydać w bits
# zawsze odejmujemy 1023

println(bits(b))
#= 10000000000 ==  1024 czyli 2^(1024-1023) = 2^1 domyślnie jest 1
    czyli w sumie 1 * 2^1 = 2

f - część ułamkowa mantysy ma 52 bity
czyli najmniejsza wartość 1.000...1 ma 1 na 52 miejscu czyli 2^(-52)

=#
println(bits(prevfloat(b)))


#=
 predział [1/2,1]
 cecha dla 1/2 bedzie -1 czyli 1022
 spodziewana precyzja = 2^(-52) * 2^(-1) = 2^(-53)
 =#
c = Float64(0.5)
c2 = nextfloat(c)
prec = c2 - c
println(bits(c))
println(prec)
println(0.5^53)

#=
w przediale [2,4]
cecha wynosi 2^1, czyli 2^(1024-1023)
spodziewana precyzja to 2^(-52)*2^(1) = 2^(-51)
=#
d = Float64(2)
d2 = nextfloat(d)
prec = d2-d
println(prec)
println(0.5^51)
