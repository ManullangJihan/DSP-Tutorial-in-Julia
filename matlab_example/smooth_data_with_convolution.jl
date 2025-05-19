# Activate environment and install dependencies defined in Project.toml
include("../env/activate_env.jl")

using LinearAlgebra
using FFTW
using DSP
using Plots

function peaks(x, y)
    return 3 * (1 - x)^2 * exp(-(x^2) - (y + 1)^2) -
           10 * ((x / 5) - x^3 - y^5) * exp(-x^2 - y^2) -
           1 / 3 * exp(-(x + 1)^2 - y^2)
end

x = LinRange(-3, 3, 100)'
y = LinRange(-3, 3, 100)
Z = @. peaks(x, y) 
contour(1:100, y, Z)

Znoise = Z .+ rand(100) .- 0.5
contour(Znoise)

K = (1/9) .* ones(3)
Zsmooth1 = conv(Znoise, K)
contour(Zsmooth1)

K = (1/25) .* ones(5)
Zsmooth2 = conv(Znoise, K)
contour(Zsmooth2)

