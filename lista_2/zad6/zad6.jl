#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#

x = Array{Float64}(41)

function run()
  for i in 2:41
    x[i] = x[i-1]^2 + c
  end
  println("------------------------------------")
  println(x)
end


x[1] = 1
c = Float64(-2)
run()


c = -2
x[1] = 2
run()

c = -2
x[1] = 1.99999999999999
run()

c = -1
x[1] = 1
run()

x[1] = -1
run()

x[1] = 0.75
run()

x[1] = 0.25
run()
