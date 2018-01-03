include("LU.jl")
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
