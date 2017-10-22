#=
  @author: Bartosz Banasik
=#
# pochodna jest równa cos(x) - 3 sin(3x)
function pochodna()

    exact_value = cos(1.0) - 3 * sin(3 * 1)
    println("Exact_value: ",exact_value)
    for i = 0:54
        h = 2.0^-i
        #result = sin.( 1.0 + h ) + cos.(3.0 * (1.0+h) )
        result = (f(1 + h) - f(1) )/h
        difference = abs(exact_value - result)
        println("n=",i," ",result,"\t\tBłąd: ",difference)
    end
end

function f(x)
  return sin.(x)+cos.(3*x)
end

pochodna()
