function LU(n::Int, l, a)

  for row = 1:l:n

    for k=row:row+l-3

      for i = k+1:row + l -1
        z = a[i,k]/a[k,k]
        a[i,k] = z

        if k+l > n
          for j = k+1:n
            a[i,j] = a[i,j] - z*a[k,j]
          end
#          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        else
          for j = k+1:k+l
            a[i,j] = a[i,j] - z*a[k,j]
          end
#          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        end


      end
    end

    if row+l > n
      k = row+l-2
      i = k+1
      z = a[i,k]/a[k,k]
      a[i,k] = z

      for j = k+1:n
        a[i,j] = a[i,j] - z*a[k,j]
      end
#      a[i,n+1] = a[i,n+1] - z*a[k,n+1]
    else

      for k = row+l-2:row+l-1
        for i = k+1:row+2*l-1
          z = a[i,k]/a[k,k]
          a[i,k] = z
          for j = k+1:k+l
            a[i,j] = a[i,j] - z*a[k,j]
          end
#          a[i,n+1] = a[i,n+1] - z*a[k,n+1]
        end
      end

    end

  end

end

function printMatrix(A,n)
  for i = 1:n
    for j = 1:n
      print(A[i,j]," ")
    end
  println()
  end
end
