#=
  @author=Bartosz Banasik
  =#
function gauss(n, a)
  v = ones(n)
  b = diagm(v)

  for k = 1:n-1
    for i = k+1:n
      z = a[i,k]/a[k,k]
      b[i,k] = z
      a[i,k] = 0
      for j = k+1:n
        a[i,j] = a[i,j]-z*a[k,j]
      end
    end
  end

  for i = 1:n
    println(a[i,:])
  end

  for i = 1:n
    println(b[i,:])
  end
end

function Gauss(n, l, a)

  v = ones(n)
  b = diagm(v)

  for row = 1:l:n

    for k=row:row+l-3
      for i = k+1:row + l -1
        z = a[i,k]/a[k,k]
        a[i,k] = 0

        if k+l > n
          for j = k+1:n
            a[i,j] = a[i,j] - z*a[k,j]
          end
        else
          for j = k+1:k+l
            a[i,j] = a[i,j] - z*a[k,j]
          end
        end


      end
    end

    if row+l > n
      k = row+l-2
      i = k+1
      z = a[i,k]/a[k,k]
      a[i,k] = 0

      for j = k+1:n
        a[i,j] = a[i,j] - z*a[k,j]
      end

    else

      for k = row+l-2:row+l-1
        for i = k+1:row+2*l-1
          z = a[i,k]/a[k,k]
          a[i,k] = 0
          for j = k+1:k+l
            a[i,j] = a[i,j] - z*a[k,j]
          end
        end
      end

    end

  end

end


println("Podaj nazwe pliku z danymi:")
file_name = readline(STDIN)
f = open(file_name)
first_line = readline(f)
n, k = split(first_line, " ")
n = parse(Int,n)
k = parse(Int, k)
A = zeros(n,n)
B = zeros(n,n)

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
@time gauss(n, A)
println("Szybki")
#@time gauss(n,k,B)
