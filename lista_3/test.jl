include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

f(x) = -x^2 + 1
p(x) = -2x

r, v, it, err = mbisekcji(f,-2.0,0.0,0.00001,0.0000001)
println(r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f,p, -2.0, 0.0, 0.0001, 0.00002, 10)
println(r," ",v, " ",it, " ", err)

r, v, it, err = msiecznych(f, -2.0, 0.0, 0.0001, 0.00002, 10)
println(r," ",v, " ",it, " ", err)
