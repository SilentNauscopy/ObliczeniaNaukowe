using matrixgen

# c= 10
function generate(size, l, c::Float64)
  blockmat(size, l , c, "A.txt")

  f = open("A.txt")
  first_line = readline(f)
  n, k = split(first_line, " ")
  n = parse(Int,n)
  k = parse(Int, k)
  A = spzeros(n,n)

  for line in eachline(f)
    i, j, value = split(line, " ")
    i = parse(Int, i)
    j = parse(Int, j)
    value = parse(Float64, value)
    A[i,j] = value
  end

  f2 = open("b.txt","w")
  write(f2,"$n\n")
  for i =  1:n
    value = 0
    for j = 1:n
      value += A[i,j]
    end
    write(f2,"$value\n")
  end

  close(f2)
  close(f)
end
