#=
    @author=Bartosz Banasik
=#
include("zad1.jl")
include("zad2.jl")
include("zad3.jl")

f(x) = 3x - exp(x)

# petla sprawdzajaca przedzialy wielkosci 1
for i = -4:4
    r, v, it, err = mbisekcji(f,Float64(i),Float64(i+1),10^(-4.0),10^(-4.0))
    if err == 0
        println(r," ",v, " ",it, " ", err)
    end
end
