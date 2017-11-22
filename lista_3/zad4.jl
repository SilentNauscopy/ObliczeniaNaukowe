#=
    @author=Bartosz Banasik
=#

include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

f(x) = sin(x) - ((1/2)*x)^2
p(x) = cos(x) - x/2
r, v, it, err = mbisekcji(f,1.5,2.0,(1/2)*10^(-5.0),(1/2)*10^(-5.0))
println(r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f,p, 1.5, (1/2)*10^(-5.0), (1/2)*10^(-5.0), 10)
println(r," ",v, " ",it, " ", err)

r, v, it, err = msiecznych(f, 1.0, 2.0, (1/2)*10^(-5.0), (1/2)*10^(-5.0), 10)
println(r," ",v, " ",it, " ", err)
