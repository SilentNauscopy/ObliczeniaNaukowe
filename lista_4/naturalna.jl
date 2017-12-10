using Polynomials
#=
  @author=Bartosz Banasik
=#


function naturalna(x::Vector{Float64}, fx::Vector{Float64})

  n = length(x)

  #Tablica przetrzymująca współczynniki postaci naturalnej
  a = zeros(n)

  a[n] = fx[n]

  for i = n-1:-1:1
    xi = x[i]
    a[i] = fx[i];
    for k = i:(n-1)
      a[k] = a[k] - xi * a[k+1]
    end
  end
  return a
end
