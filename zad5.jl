#!/usr/bin/env julia

x = Float32[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
y = Float32[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]

function wprzod(x,y)
    S = 0
    for i = 1:5
        S += x[i] * y[i]
    end

    return S
end

function wtyl(x,y)
    S = 0
    for i = 5:-1:1
        S += x[i] * y[i]
    end
    return S
end

function odNajwiekszego(x,y)
    sumPos = Float32[]
    sumNeg = Float32[]
    S = 0
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
    SumPositive = 0
    SumNegative = 0
    for i = length(sumPos):-1:1
        SumPositive += sumPos[i]
    end
    for i = 1:length(sumNeg)
        SumNegative += sumNeg[i]
    end
    S = SumPositive + SumNegative
    return S
end

function odNajmniejszego(x,y)
    sumPos = Float32[]
    sumNeg = Float32[]
    S = Float32(0)
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
    SumPositive = 0
    SumNegative = 0

    for i = 1:length(sumPos)
        SumPositive += sumPos[i]
    end

    for i = length(sumNeg):-1:1
        SumNegative += sumNeg[i]
    end
    S = SumPositive + SumNegative
    return S
end


result  = wprzod(x,y)
println(result)
result2 = wtyl(x,y)
println(result2)
result3 = odNajwiekszego(x,y)
println(result3)
result4 = odNajmniejszego(x,y)
println(result4)
