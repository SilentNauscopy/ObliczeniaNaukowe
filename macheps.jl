#!/usr/bin/env julia

function macheps()
    a = Float64(1)
    b = Float32(1)
    c = Float16(1)
    for T in [Int8, Int16, Int32, Int64, Int128, UInt8, UInt16, UInt32, UInt64, UInt128, UInt]
        println("$(lpad(T,7)): [$(typemin(T)),$(typemax(T))]")
    end

    for T in [Float16, Float32, Float64]
        println("$(lpad(T,7)): [$(eps(T)), $(nextfloat(T(0.0)))")
        println("$(lpad(T,7)): [$(realmin(T)),$(realmax(T))]")
    end

    while 1 + a > 1
        a = a/2
    end
    println(a*2)

    while 1 + b > 1
        b = b/2
    end
    println(b*2)

    while 1 + c > 1
        c = c/2
    end
    println(c*2)

end


function jjjj()

    a = Float64(1)
    b = Float32(1)
    c = Float16(1)

    while true
        if a/2>0
            a = a/2
        else
            break
        end
    end
    println("$(typeof(a)): [$a, $(bits(a))]")

    while true
        if b/2>0
            b = b/2
        else
            break
        end
    end
    println("$(typeof(b)): [$b, $(bits(b))]")


    while true
        if c/2>0
            c = c/2
        else
            break
        end
    end
    println("$(typeof(c)): [$c, $(bits(c))")
end


function findmaximum()
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

    while true
        if !isinf(a*2)
            a = a * 2
            println(bits(a))
        else
            break
        end
    end
    println(a," ",bits(a))
    println(realmax(Float64)," ",bits(realmax(Float64)))
end


macheps()
jjjj()
findmaximum()
