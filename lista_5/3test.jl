using blocksys

generate(50000,4,10.)
println("Generating done")
typ = readline(STDIN)

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
if typ == 2
    X = GaussWithMaster(n,k,A)
else
    X = Gauss(n, k, A)
end
t = toq()
println(t)
f = open("wynik.txt","w")

err_x = fill(1.0, n)
rel_error = abs((norm(err_x - X))/norm(err_x))
write(f, "$rel_error\n")
for i in X
write(f, "$i\n")
end
close(f)
