#=
    @author=Bartosz Banasik
=#
function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxint::Int)
    v = f(x0)
    if abs(v) < epsilon
        return x0, v, 0, 2
    end
    for k in range(1,maxint)
        x1 = x0 - v/pf(x0)
        v = f(x1)
        if (abs(x1-x0) < delta || abs(v) < epsilon)
            return x1, v, k, 0
        end
        x0 = x1
    end
    return x0, v, k, 1
end
