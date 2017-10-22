#=
  @author: Bartosz Banasik
=#


function f(x)
    return sqrt(x^2+1)-1
end

function g(x)
    return x^2/(sqrt(x^2+1)+1)
end

for i = 1:10
    println(f(8.0^-i))
    println(g(8.0^-i))
end
