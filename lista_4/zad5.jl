using Interpolation
for n=5:5:15
    rysujNnfx(x-> exp(x), 0., 1., n)
end
for n=5:5:15
    rysujNnfx(x-> x^2 * sin(x), -1.0, 1., n)
end
