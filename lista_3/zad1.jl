#=
    @author=Bartosz Banasik
=#
# Dokumentacja w sprawozdaniu
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    u = f(a)
    v = f(b)
    e = b - a
    er = 0
    k = 1
    c = 0
    w = 0
    if sign(u) == sign(v)
        er = 1
        return c, w, k, er
    end

    while true
        e = e/2
        c = a+e
        w = f(c)
        if abs(e) < delta || abs(w) < epsilon
            return c, w, k, er
        end
        if sign(w) != sign(u)
            b = c
            v = w
        else
            a = c
            u = w
        end
        k = k+1
    end
end
