function findAbsMax1(k,l,A)
  #println(k, " ", l-(k%l-1))
  depth = l-(k%l)
  max = 0
  index = -1
  for i = k:k+depth
    if abs(A[i,k]) > max
      max = A[i,k]
      index = i
    end
  end
  #println("Maxvalue $max index [$k,$index]")
  if index != -1
    return index
  else
    return k
  end
end

function findAbsMax2(k,l,A, finish)
  depth = finish

  max = 0
  index = -1
  for i = k:depth
    #println(i)
    if abs(A[i,k]) > max
      max = A[i,k]
      index = i
    end
  end
  if index != -1
    return index
  else
    return k
  end
end

function findAbsMaxLast2(k,A)
  if A[k,k] < A[k+1,k]
    return k+1
  else
    return k
  end
end

function Gauss(n::Int, l, a)

  for row = 1:l:n
    #sprawdzmy na l%k dla wszystkihc oprócz 2 ostatnich

    for k = row:row+l-3
      #println(k)
      index = findAbsMax1(k,l,a)
      if index != k
      #  println("swap")
        swaprows(a, k, index, k,n,l)
      end
    #  println(k)
      for i = k+1:row + l -1
        z = a[i,k]/a[k,k]
        a[i,k] = 0

        #if k+l > n
        if k+2*l+1 > n
          for j = k+1:n
            a[i,j] = a[i,j] - z*a[k,j]
          end
          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        else
          for j = k+1:k+2*l+1
            a[i,j] = a[i,j] - z*a[k,j]
          end
          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        end
      end
    end

    if row+l > n
      # zostala nam jeden wiersz tylko

      k = row+l-2
      #println(k)
      index = findAbsMaxLast2(k,a)
      if index != k
        swaprows(a, k, index, k,n,l)
      end

      i = k+1
      z = a[i,k]/a[k,k]
      a[i,k] = 0

      for j = k+1:n
        a[i,j] = a[i,j] - z*a[k,j]
      end
      a[i,n+1] = a[i,n+1] - z*a[k,n+1]
    else

      for k = row+l-2:row+l-1

        #println(k)
        #ostatnie 2 w sekwencji
        index = findAbsMax2(k,l,a, row+2*l-1)
        if index != k
          swaprows(a,k, index, k,n,l)
        end
        for i = k+1:row+2*l-1
          z = a[i,k]/a[k,k]
          a[i,k] = 0
          if k+2*l+1 > n
            for j = k+1:n
              a[i,j] = a[i,j] - z*a[k,j]
            end
          else
            for j = k+1:k+2*l+1
              a[i,j] = a[i,j] - z*a[k,j]
            end
          end
          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        end
      end

    end

  end

  X = Array{Float64}(n)
  for i = n:-1:1
    X[i] = A[i,n+1]
    if i+2*l+1 > n

      for j = i+1:n
        X[i] = X[i] - A[i,j]*X[j]
      end
    else
      for j = i+1:i+2*l+1
        X[i] = X[i] - A[i,j]*X[j]
      end

    end

    X[i] = X[i]/A[i,i]
  end

  println(X)
end

function swaprows(A, row1, row2, first_element, n, l)

  if first_element + 2 + 2*l -1 > n

      tmp = A[row1,first_element:n]
      A[row1,first_element:n] = A[row2,first_element:n]
      A[row2,first_element:n] = tmp

  else

    tmp = A[row1,first_element:first_element+2+2*l-1]
    A[row1,first_element:first_element+2+2*l-1] = A[row2,first_element:first_element+2+2*l-1]
    A[row2,first_element:first_element+2+2*l-1] = tmp

  end

  temp = A[row1,n+1]
  A[row1,n+1] = A[row2,n+1]
  A[row2,n+1] = temp
#  println("SWAP ------ $row1 ---> $row2 ----------------------")
#  printMatrix(A,n)
end

function printMatrix(A,n)
  for i = 1:n
    for j = 1:(n+1)
      print(A[i,j]," ")
    end
  println()
  end
end

println("Podaj nazwe pliku z danymi prawych stron")
file_name2 = readline(STDIN)
f2 = open(file_name2)
n2 = readline(f2)
n2 = parse(Int, n2)
A = spzeros(n2,n2+1)

for i = 1:n2
  value = readline(f2)
  value = parse(Float64, value)
  A[i,n2+1] = value
end


println("Podaj nazwe pliku z danymi:")
file_name = readline(STDIN)
f = open(file_name)
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
close(f2)

#printMatrix(A,n)
#=
swaprows(A,4,5,1,n,k)
println("###########################################################")
printMatrix(A,n)
=#
@time Gauss(n,k,A)
#printMatrix(A,n)
