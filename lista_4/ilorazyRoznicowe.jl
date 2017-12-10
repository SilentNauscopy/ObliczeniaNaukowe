#=
@author=Bartosz Banasik
=#
#= Poniższa funkcja miała porządkować węzły

function order(x::Vector{Float64}, f::Vector{Float64})
    for i in [2:length(x)]
        j = 2
        while(j > 1 && x[j-1]>x[j])
            tmp = x[j]
            x[j] = x[j-1]
            x[j-1]=tmp

            #'''This is to change the secound array '''
            tmp = f[j]
            f[j] = f[j-1]
            f[j-1]=tmp

            j = j-1
        end
    end
end
=#


function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
#    order(x, f)

    # Tablica przetrzymująca ilorazy różnicowe
    d = zeros(length(x))

    # Inicjalizacja
    for i in range(1,length(x))
        d[i] = f[i]
    end

    # Użycie algorytmów
    for j in range(2, length(x))
        for i = length(x):-1:j
            d[i] = (d[i] - d[i-1]) / (x[i]-x[i-j+1])
        end
    end

    return d
end
