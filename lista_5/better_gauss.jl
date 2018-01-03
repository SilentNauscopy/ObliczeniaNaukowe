#=
  @author=Bartosz Banasik
=#
function Gauss(n::Int, l, a)

  #Zaczynamy dla każdego kwadratu po przekątnej
  for row = 1:l:n

    #Dla głównych kwadratów bez dwóch ostatnich wierszy
    for k=row:row+l-3

      #Będziemy zerować tylko do końca kwadratu nie dalej
      for i = k+1:row + l -1
        z = a[i,k]/a[k,k]
        a[i,k] = 0

        #sprawdzamy ile miejsca zostało nam po prawej do obliczenia wiersza
        #jęsli mniej niż l to tylko do końca tablicy w przeciwnym razie sprawdzamy do końca
        #kwadratu
        if k+l > n
          for j = k+1:n
            a[i,j] = a[i,j] - z*a[k,j]
          end
          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        else
          for j = k+1:k+l
            a[i,j] = a[i,j] - z*a[k,j]
          end
          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        end
      end
    end

    #dla dwoch ostatnich wierszy z kwadratu
    #sprawdzamy czy są ta faktycznie ostatnie wiersze
    if row+l > n
      k = row+l-2
      i = k+1
      z = a[i,k]/a[k,k]
      a[i,k] = 0
      for j = k+1:n
        a[i,j] = a[i,j] - z*a[k,j]
      end
      a[i,n+1] = a[i,n+1] - z*a[k,n+1]
    else
      for k = row+l-2:row+l-1
        for i = k+1:row+2*l-1
          z = a[i,k]/a[k,k]
          a[i,k] = 0
          for j = k+1:k+l
            a[i,j] = a[i,j] - z*a[k,j]
          end
          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        end
      end
    end
  end

  #Obliczanie wyniku
  X = Array{Float64}(n)
  for i = n:-1:1
    X[i] = a[i,n+1]
    if i+l > n
      for j = i+1:n
        X[i] = X[i] - a[i,j]*X[j]
      end
    else
      for j = i+1:i+l
        X[i] = X[i] - a[i,j]*X[j]
      end
    end
    X[i] = X[i]/a[i,i]
  end
  #=
  f = open("wynik.txt","w")
  for i in X
    write(f, "$i\n")
  end
  close(f)
  =#
  return X
end

function printMatrix(A,n)
for i = 1:n
  for j = 1:(n+1)
    print(A[i,j]," ")
  end
println()
end

end
#=
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
println("Wczytano dane")
println("Szybki")
@time Gauss(n,k,A)
#printMatrix(A,n2)
=#
