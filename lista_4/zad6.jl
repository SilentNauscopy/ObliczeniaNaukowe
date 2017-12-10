using Interpolation
for n = 5:5:15
    rysujNnfx(x-> abs(x), -1.,1.,n)
end
for n = 5:5:15
    rysujNnfx(x-> 1/(1+x^2), -5.,5.,n)
end
