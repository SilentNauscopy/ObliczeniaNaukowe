function pochodna()
    for i = 0:54
        h = 2.0^-i
        result = sin.( 1.0 + h ) + cos.(3.0 * (1.0+h) )
        println(result)
    end
end

pochodna()
