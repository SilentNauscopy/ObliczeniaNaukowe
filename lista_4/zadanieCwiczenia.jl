using Interpolation

x = zeros(4)
y = zeros(4)
x = [-1., 0, 1, 2]
y = [-1., 0, -1, 2]

#y = [-1, 0, -1, 2]

ilorazy = ilorazyRoznicowe(x, y)
wspolczynniki = naturalna(x, ilorazy)
println(wspolczynniki)
