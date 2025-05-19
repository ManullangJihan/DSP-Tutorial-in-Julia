# Activate environment and install dependencies defined in Project.toml
include("../env/activate_env.jl")

using FFTW
using LinearAlgebra
using Plots
using Plots: plot, plot!

t = 0:.1:10
y = sin.(t)
plot(t, y, legend=false)

y = @. sin(t) + sin(3*t)/3
plot(t, y, legend=false)

y = @. sin(t) + sin(3*t)/3 + sin(5*t)/5 + sin(7*t)/7 + sin(9*t)/9
plot(t, y, legend=false)

t = 0:.02:3.14
y = zeros(10, length(t))
x = zeros(size(t))
for k = 1:2:19
   x = @. x + sin(k*t) / k
   idx = Int(floor(k+1)/2)
   y[idx, :] = x
end

plot(y[1:2:9, :]', legend=false)
title!("The building of a square wave: Gibbs'' effect")
surface(y)