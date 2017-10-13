#!/usr/bin/env julia
a = Float64(1)
while a < 2
    if(nextfloat(a)-a == 0.5^(52))
        a = nextfloat(a)
        println(a)
    else
        println("Nie")
        break
    end
end
