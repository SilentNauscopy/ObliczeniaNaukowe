#=
  @author=Bartosz Banasik
=#

function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
  n = length(x)

  # Tablica używana w algorytmie Hornera
  q = zeros(n)

  #Ostatnią wartość mamy z definicji
  q[n] =  fx[n]
  for i = n-1:-1:1
    q[i] = fx[i] + (t - x[i]) * q[i+1]
  end

  return q[1]

end
