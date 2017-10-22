#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#
function onetotwo()
    # zaczynamy od najmniejszej liczby zaraz po jedynce
    a = Float64(1)
    a = nextfloat(a)

    # jeśli warunek zadania jest spełniony to szukamy dalej
    # w przeciwnym razie wypisujemy naszą liczbę
    while true
        if a * (1.0/a) == 1
            a = nextfloat(a)
        else
            println(a)
            println(bits(a))
            break
        end
    end
end

#ta funkcja działa bardzo podobnie tyle że zaczyna od najmniejszej wartości w typie
function minimal()
    a = realmax(Float64)
    a *= -1
    while true
        if a * (1.0/a) == 1
            a = nextfloat(a)
        else
            println(a)
            println(bits(a))
            break
        end
    end
end

onetotwo()
minimal()
