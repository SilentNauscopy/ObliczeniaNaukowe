#=
    @author=Bartosz Banasik
=#
#Dokumentacja w pdf
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxint::Int)
    fa = f(x0)
    fb = f(x1)
    for k in range(1,maxint)
        if abs(fa) > abs(fb)
            tempa = x0
            x0 = x1
            x1 = tempa
            tempfa = fa
            fa = fb
            fb = tempfa
        end
        s = (x1-x0)/(fb-fa)
        x1 = x0
        fb = fa
        x0 = x0 - fa*s
        fa = f(x0)
        if abs(x1-x0) < delta || abs(fa) < epsilon
            return x0, fa, k, 0
        end
    end
    return x0, fa, k, 1
end
