using Plots
#=
    @author=Bartosz Banasik
=#

#silnik rysujący
plotly()

#So that display() used below generates new figure windows:
Plots.default(overwrite_figure=false)

include("ilorazyRoznicowe.jl")
include("warNewton.jl")
include("naturalna.jl")

function rysujNnfx(f, a::Float64, b::Float64, n::Int)

    x = zeros(n+1)
    y = zeros(n+1)

    # Liczenie węzłów interpolacyjnych i ich wartośći
    for i = 0:n
        h = (b-a)/n
        x[i+1] = a + i*h
        y[i+1] = f(x[i+1])
    end

    # Obliczanie ilorazów różnicowych
    fx = ilorazyRoznicowe(x, y)

    #Ilosc - liczba punktów potrzebna do rysowania wykresu
    # i dalsze obliczenia wartości dla tych punktów

    ilosc = (b-a)/0.0001
    ilosc = Int(ilosc)

    x2 = zeros(ilosc)

    for i = 0:1:ilosc-1
        x2[i+1] = a + i*0.0001
    end

    f_x2 = zeros(ilosc)

    for i = 1:1:ilosc
        f_x2[i] = warNewton(x, fx, x2[i])
    end

    # Wykres funkcji interpolacyjnej
    plt1 = plot(x2, f_x2,color="red",label="Nn(x)")

    #wykres funkcji prawdziwej
    plt = plot!(plt1, x2, f, color="green", label="F(x)")
    display(plt)

    return x2, f_x2
end
