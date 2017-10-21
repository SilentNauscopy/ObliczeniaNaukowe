#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#

# funkcja wyznaczająca iteracyjnie epsilon maszynowy
function macheps()

    # zmienne a , b, c są potrzebne do obliczenia 'macheps' odpowiednio
    # dla danego typu

    a = Float64(1)
    b = Float32(1)
    c = Float16(1)

    # pętla wyświetlająca dane patrzebne do porównań
    for T in [Float64, Float32, Float16]
        println("$(lpad(T,7)): [ eps: $(eps(T))]")
    end

    # kolejne pętle iteracyjnie zmiejszają odpowiednie wartości
    # do zadanego warunku ~(1 + x > 1) na końcu liczba x jest
    # mnożona przez 2 ponieważ szukamy najmniejszej liczby spełniającej
    # warunek
    while 1.0 + a > 1.0
        a = a/2
    end
    println("Float 64: eps $(a*2)")

    while Float32(1.0) + b > Float32(1.0)
        b = b/2
    end
    println("Float32: eps $(b*2)")

    while Float16(1.0) + c > Float16(1.0)
        c = c/2
    end
    println("Float16 eps $(c*2)")

end

# funkcja wyznaczająca iteracyjnie wartość eta tzn.
# eta > 0.0
function etaNum()
    # Zmienne na których będą wykonywane operacje
    a = Float64(1)
    b = Float32(1)
    c = Float16(1)

    # pętla wyświetlająca dane do porównania
    for T in [Float64, Float32, Float16]
        println("$(lpad(T,7)): [ nextfloat: $(nextfloat(T(0.0)))]")
    end

    # kolejne pętle wyznaczają wartość eta dla odpowiednich typów
    while true
        if a/2>0
            a = a/2
        else
            break
        end
    end
    println("$(typeof(a)): eta [$a, $(bits(a))]")

    while true
        if b/2>0
            b = b/2
        else
            break
        end
    end
    println("$(typeof(b)): eta [$b, $(bits(b))]")


    while true
        if c/2>0
            c = c/2
        else
            break
        end
    end
    println("$(typeof(c)): eta [$c, $(bits(c))")
end

# funckaj wyznaczająca iteracyjnie maksymalną wartość w danym typie
function findmaximum()

    # pętla wyświetlająca dane do porównania
    for T in [Float64, Float32, Float16]
        println("$(lpad(T,7)): [ MAX: $(realmax(T))]")
    end

    # pierwsza petla pozwala na 'utworzenie' makymalnej liczby
    # przy niezmienionej cesze (maksymalna mantysa)
    a = Float64(1)
    b = Float64(1)
    while true
        b = b/2
        if a + b < 2
            a += b
        else
            break
        end
    end

    # druga petla mnoży daną liczbę razy dwa
    # tzn zwiększa jej cechę
    while true
        if !isinf(a*2)
            a = a * 2
        else
            break
        end
    end
    println("$(typeof(a)): max $(a)")

    # kolejne petle tylko dla innych typów
    a = Float32(1)
    b = Float32(1)
    while true
        b = b/2
        if a + b < 2
            a += b
        else
            break
        end
    end

    while true
        if !isinf(a*2)
            a = a * 2
        else
            break
        end
    end
    println("$(typeof(a)): max $a")


    a = Float16(1)
    b = Float16(1)
    while true
        b = b/2
        if a + b < 2
            a += b
        else
            break
        end
    end

    while true
        if !isinf(a*2)
            a = a * 2
        else
            break
        end
    end
    println("$(typeof(a)): max $a")

end


#macheps()
#etaNum()
findmaximum()
