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

function genB(A::Array{Float64})

        x = ones(Float64, size(A)[1], 1)
        B = A*x
        return B
end

n = 5
for i in range(1,20)
        println("-------------------------------------------")
        A = hilb(i)

        B = genB(A)

        x = A\B
        println("A\\B: ")
        println(x)
        println("inv(a)*b")
        x = inv(A)*B
        println(x)
end

for i in [5, 10, 20]
        for c in Float64[1, 10, 10^3, 10^7, 10^12, 10^16]
                println("----------------------------------------------------")
                A = matcond(i,c)
                B = genB(A)
                x = A\B
                println("n = ", i, " c = ", c)
                println("A\\B: ", x )
                x = inv(A)*B
                println("inv(A)*B: ", x )
        end
end
