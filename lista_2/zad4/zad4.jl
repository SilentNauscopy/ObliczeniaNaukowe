#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#

using Polynomials

#Wielomian wilkinsona w postaci 1*x^0 + (-210)* x^1 ... więc trzeba go odwrócić

p =   [1, -210.0, 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0]

WilkinsonPoly = Poly(reverse(p))
WilkinsonZeros = roots(WilkinsonPoly)
#println(WilkinsonZeros)
println("-------------------------------------------")
println("roots:")
for i in WilkinsonZeros
  println(i)
end
println("--------------------------------------------")
println("Values of roots for normal")
WilkinsonProducts = poly(1:20)
for i in WilkinsonZeros
  println("root = $i \t$(abs(WilkinsonPoly(i)))")
end

println("--------------------------------------------")
println("Values of roots for products")
for i in WilkinsonZeros
  println("root = $i \t$(abs(WilkinsonProducts(i)))")
end
