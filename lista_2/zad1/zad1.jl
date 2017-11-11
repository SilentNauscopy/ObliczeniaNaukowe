#!/usr/bin/env julia
#=
  @author: Bartosz Banasik
=#

# Dane wektory z treści zadania już zmienione
x = Float32[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
y = Float32[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

a = Float64[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
b = Float64[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

# funkcja sumująca po kolei
function wprzod(x,y)
    S = 0
    for i = 1:5
        S += x[i] * y[i]
    end
    return S
end

# funkcja sumująca od końca
function wtyl(x,y)
    S = 0
    for i = 5:-1:1
        S += x[i] * y[i]
    end
    return S
end

# funkcja sumująca od największej do najmniejszej wartośći
function odNajwiekszego(x,y)
    # tutaj będą przetrzymywane sumy dodatnie
    sumPos = []

    # tutaj będą przetrzymywane sumy ujemne
    sumNeg = []

    # tutaj koncowy wynik
    S = 0

    # jeśli iloczyn jest większy od 0 ląduje w sumPos
    # w przeciwnym razie ląduje w sumNeg
    for i = 1:5
        tempSum = x[i] * y[i]
        if(tempSum > 0)
            push!(sumPos,tempSum)
        else
            push!(sumNeg, tempSum)
        end
    end

    #sortujemy sumy aby móc je dodać w odpowidniej kolejnośći
    sumPos = sort(sumPos)
    sumNeg = sort(sumNeg)

    #sumy cześciowe dodatnie i ujemny
    SumPositive = 0
    SumNegative = 0

    #sumowanie sum dodatnich w kolejności od największej
    for i = length(sumPos):-1:1
        SumPositive += sumPos[i]
    end

    #sumowanie sum ujemnych w kolejnośći od najmniejszej
    for i = 1:length(sumNeg)
        SumNegative += sumNeg[i]
    end

    #obliczenie końcowej sumy
    S = SumPositive + SumNegative
    return S
end

# ta funkcja działa analogicznie oprócz kolejności sumowania
# sum cząstkowych

function odNajmniejszego(x,y)
    sumPos = typeof(x[1])[]
    sumNeg = typeof(x[1])[]
    S = typeof(x[1])(0.0)
    for i = 1:5
        tempSum = x[i] * y[i]
        if(tempSum > 0)
            push!(sumPos,tempSum)
        else
            push!(sumNeg, tempSum)
        end
    end

    sumPos = sort(sumPos)
    sumNeg = sort(sumNeg)
    SumPositive = typeof(x[1])(0.0)
    SumNegative = typeof(x[1])(0.0)

    for i = 1:length(sumPos)
        SumPositive += sumPos[i]
    end

    for i = length(sumNeg):-1:1
        SumNegative += sumNeg[i]
    end
    S = SumPositive + SumNegative
    return S
end

println(typeof(x))
result  = wprzod(x,y)
println("W przód: ",result)
result2 = wtyl(x,y)
println("W tyl: ",result2)
result3 = odNajwiekszego(x,y)
println("Od największego ",result3)

result4 = odNajmniejszego(x,y)
println("Od najmniejszego: ",result4)

println(typeof(a))
result  = wprzod(a,b)
println("W przód: ",result)
result2 = wtyl(a,b)
println("W tyl: ",result2)
result3 = odNajwiekszego(a, b)
println("Od największego ",result3)
result4 = odNajmniejszego(a,b)
println("Od najmniejszego: ",result4)
