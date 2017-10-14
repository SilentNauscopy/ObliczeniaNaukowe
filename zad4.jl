#!/usr/bin/env julia
function onetotwo()
    a = Float64(1)
    a = nextfloat(a)
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

function minimal()
    a = nextfloat(Float64(0))
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

minimal()
