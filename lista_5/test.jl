#=include("LU.jl")
include("LUwithMaster.jl")

println("Podaj nazwe pliku z danymi:")
file_name = readline(STDIN)
f = open(file_name)
first_line = readline(f)
n, k = split(first_line, " ")
n = parse(Int,n)
k = parse(Int, k)
A = spzeros(n,n)
B = spzeros(n,n)

for line in eachline(f)
  i, j, value = split(line, " ")
  i = parse(Int, i)
  j = parse(Int, j)
  value = parse(Float64, value)
  A[i,j] = value
  B[i,j] = value
end

close(f)
println("Wczytano dane")
println("Normalny")
@time LUwithMaster(n,k, A)
printMatrix(A, n)
=#
using blocksys
start = 100
step = 40
max = 50000
time = open("dane_do_wykresu2","w")
for i = start:step:max

  generate(i,4,10.)

  f2 = open("b.txt")
  n2 = readline(f2)
  n2 = parse(Int, n2)
  A = spzeros(n2,n2+1)

  for i = 1:n2
    value = readline(f2)
    value = parse(Float64, value)
    A[i,n2+1] = value
  end
  close(f2)

  f = open("A.txt")
  first_line = readline(f)
  n, k = split(first_line, " ")
  n = parse(Int,n)
  k = parse(Int, k)

  for line in eachline(f)
    i, j, value = split(line, " ")
    i = parse(Int, i)
    j = parse(Int, j)
    value = parse(Float64, value)
    A[i,j] = value
  end

  close(f)

  tic()
  Gauss(n,k,A)
  t = toq()
  #println(t)
  write(time, "$(i) $t\n")
end
close(time)
