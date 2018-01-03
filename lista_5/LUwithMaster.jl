function LUwithMaster(n::Int, l, a)

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
        else
          for j = k+1:k+2*l+1
            a[i,j] = a[i,j] - z*a[k,j]
          end
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
        end
      end

    end

  end
end

function swaprows(A, row1, row2, first_element, n, l)

  if first_element + 2 + 2*l -1 > n
    if first_element-l < 1
      tmp = A[row1,1:n]
      A[row1,1:n] = A[row2,1:n]
      A[row2,1:n] = tmp

    else

      tmp = A[row1,first_element-l:n]
      A[row1,first_element-l:n] = A[row2,first_element-l:n]
      A[row2,first_element-l:n] = tmp
    end

  else
    if first_element-l < 1
      tmp = A[row1,1:n]
      A[row1,1:n] = A[row2,1:n]
      A[row2,1:n] = tmp

    else
      tmp = A[row1,first_element-l:first_element+2+2*l-1]
      A[row1,first_element-l:first_element+2+2*l-1] = A[row2,first_element-l:first_element+2+2*l-1]
      A[row2,first_element-l:first_element+2+2*l-1] = tmp
    end

  end
#  println("SWAP ------ $row1 ---> $row2 ----------------------")
#  printMatrix(A,n)
end
