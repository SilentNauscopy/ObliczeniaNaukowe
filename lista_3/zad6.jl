#=
    @author=Bartosz Banasik
=#
include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

f1(x) = exp(1-x)-1
f2(x) = x*exp(-x)
p1(x) = -exp(1-x)
p2(x) = -exp(-x)*(x-1)

r, v, it, err = mbisekcji(f1, 0.5, 1.5,10^(-5.0),10^(-5.0))
println(r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f1,p1, 0.5, 10^(-5.0), 10^(-5.0), 10)
println(r," ",v, " ",it, " ", err)

r, v, it, err = msiecznych(f1, 0.5, 1.5, 10^(-5.0), 10^(-5.0), 10)
println(r," ",v, " ",it, " ", err)




r, v, it, err = mbisekcji(f2, -1.0, 1.0, 10^(-5.0),10^(-5.0))
println(r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f2,p2, 0.5, 10^(-5.0), 10^(-5.0), 100)
println(r," ",v, " ",it, " ", err)

r, v, it, err = msiecznych(f2, -1.0, 1.0, 10^(-5.0), 10^(-5.0), 100)
println(r," ",v, " ",it, " ", err)
