#=
    @author=Bartosz Banasik
=#

#Dołączane biblioteki
include("zad1.jl")
include("zad2.jl")
include("zad3.jl")


#Funkcje podane w zadaniu
f1(x) = exp(1-x)-1
f2(x) = x*exp(-x)

#Pochodne tych funkcji
p1(x) = -exp(1-x)
p2(x) = -exp(-x)*(x-1)

r, v, it, err = mbisekcji(f1, 0.5, 1.6,10^(-5.0),10^(-5.0))
println("Bisekcji f1: ", r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f1,p1, 0.5, 10^(-5.0), 10^(-5.0), 10)
println("Newtona f1: ", r," ",v, " ",it, " ", err)

r, v, it, err = msiecznych(f1, 0.5, 1.5, 10^(-5.0), 10^(-5.0), 10)
println("Siecznych f1: ",r," ",v, " ",it, " ", err)


r, v, it, err = mbisekcji(f2, -1.0, 1.1, 10^(-5.0),10^(-5.0))
println("Bisekcji f2: ", r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f2,p2, 0.5, 10^(-5.0), 10^(-5.0), 100)
println("Newtona f2: ", r," ",v, " ",it, " ", err)

r, v, it, err = msiecznych(f2, -1.0, 1.0, 10^(-5.0), 10^(-5.0), 100)
println("Siecznych f2: ", r," ",v, " ",it, " ", err)


r, v, it, err = mstycznych(f1,p1, 3.0, 10^(-5.0), 10^(-5.0), 10)
println("Newtona dla innego x f1  ", r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f2, p1, 2.0, 10^(-5.0), 10^(-5.0), 10)
println("Newtona dla innego x f2  ", r," ",v, " ",it, " ", err)

r, v, it, err = mstycznych(f1, p1, 1.0, 10^(-5.0), 10^(-5.0), 10)
println("Newtona dla innego x0 = 1 f2  ", r," ",v, " ",it, " ", err)
