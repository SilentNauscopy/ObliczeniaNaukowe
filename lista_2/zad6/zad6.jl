#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#


# Funkcja zwracająca tablice wyników dla podanych parametrów
function run(x0, c)
  x = Array{Float64}(41)
  x[1] = x0
  for i in 2:41
    x[i] = x[i-1]^2 + c
  end
  println("------------------------------------")
  return x
end

wynik1 = run(1, -2)

wynik2 = run(2, -2)

wynik3 = run(1.99999999999999, -2)

wynik4 = run(1, -1)

wynik5 = run(-1, -1)

wynik6 = run(0.75, -1)

wynik7 = run(0.25, -1)

# Wyświetlanie wyników

for i in 1:41
  println("$(i-1): $(wynik1[i]), $(wynik2[i]), $(wynik3[i]), $(wynik4[i]), $(wynik5[i]), $(wynik6[i]), $(wynik7[i])")
end
