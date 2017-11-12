#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#


function matcond(n::Int, c::Float64)
# Function generates a random square matrix A of size n with
# a given condition number c.
# Inputs:
#	n: size of matrix A, n>1
#	c: condition of matrix A, c>= 1.0
#
# Usage: matcond (10, 100.0);
#
# Pawel Zielinski
        if n < 2
         error("size n should be > 1")
        end
        if c< 1.0
         error("condition number  c of a matrix  should be >= 1.0")
        end
        (U,S,V)=svd(rand(n,n))
        return U*diagm(linspace(1.0,c,n))*V'
end

function hilb(n::Int)
# Function generates the Hilbert matrix  A of size n,
#  A (i, j) = 1 / (i + j - 1)
# Inputs:
#	n: size of matrix A, n>0
#
#
# Usage: hilb (10)
#
# Pawel Zielinski
        if n < 1
         error("size n should be > 0")
        end
        A= Array{Float64}(n,n)
        for j=1:n, i=1:n
                A[i,j]= 1 / (i + j - 1)
        end
        return A
end

# Pierwsza pętla liczy rpzwiązania ukłądu równań dla macierzy współczynników
# wygenerowanej za pomocą funkcji hilb()

for i in range(1,20)
        println("-------------------------------------------")

        # Macierz prawidłowego wyniku, ktora służy to obliczenia macierzy
        # prawyh stron
        one = ones(Float64, i)

        A = hilb(i)

        # Obliczanie macierzy prawych stron
        B = A*one

        println("Rozmiar: $i, rank() = $(rank(A)), cond() = $(cond(A))")

        # Pierwsza metoda
        x = A\B
        err1 = abs(norm(x)-norm(one))/norm(one)

        # Druga metoda
        x = inv(A)*B
        err2 = abs(norm(x)-norm(one))/norm(one)
        println("Error\t$err1\t$err2")

end

# Druga pętla licząca rozwiązania układu dla macierzy współczynników
# wygenerowanych za pomocą funkcji matcond()

for i in [5, 10, 20]
        for c in Float64[1, 10, 10^3, 10^7, 10^12, 10^16]
                println("----------------------------------------------------")

                one = ones(Float64, i)
                A = matcond(i,c)
                B = A*one

                # Pierwsza metoda
                x = A\B

                println("Rozmiar $i, c = $c, rank() = $(rank(A)), cond() = $(cond(A))")
                err1 = abs(norm(x)-norm(one))/norm(one)



                # Druga metoda
                x = inv(A)*B
                err2 = abs(norm(x)-norm(one))/norm(one)
                println("Error\t$err1\t$err2")
        end
end
