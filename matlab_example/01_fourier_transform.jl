# Activate environment and install dependencies defined in Project.toml
include("../env/activate_env.jl")

using LinearAlgebra
using FFTW
using CairoMakie
using Random
Random.seed!(42)

Ts = 1/50
t = 0:Ts:10-Ts
x = sin.(2π .* 15 .* t) .+ sin.(2π .* 20 .* t)

fig1 = Figure()
ax1 = Axis(fig1[1, 1], xlabel="Time (seconds)", ylabel="Amplitude")
lines!(ax1, t, x)
fig1

y = fft(x)
fs = 1/Ts
f = (0:length(y)-1) .* fs ./ length(y)

fig2 = Figure()
ax2 = Axis(fig2[1, 1], xlabel="Frequency (Hz)", ylabel="Magnitude")
lines!(ax2, f, abs.(y))
fig2


n = length(x)
fshift = (-n/2:n/2-1) .* (fs/n)
yshift = fftshift(y)

fig3 = Figure()
ax3 = Axis(fig3[1, 1], xlabel="Frequency (Hz)", ylabel="Magnitude")
lines!(ax3, fshift, abs.(yshift))
fig3


xnoise = x .+ 2.5 .* randn(length(t))
ynoise = fft(xnoise)
ynoiseshift = fftshift(ynoise)
power = abs.(ynoiseshift).^2 ./ n

fig4 = Figure()
ax4 = Axis(fig4[1, 1], xlabel="Frequency (Hz)", ylabel="Power")
lines!(ax4, fshift, power)
fig4

# TODO
# Computational Efficiency

# Phase of Sinusoids
fs = 100
t = 0:1/fs:1-1/fs
x = cos.(2π .* 15 .*t .- π/4) .- sin.(2π .* 40 .* t)

y = fft(x)
z = fftshift(y)

ly = length(y)
f = (-ly/2:ly/2-1) ./ly .* fs

fig5 = Figure()
ax5 = Axis(fig5[1, 1], xlabel="Frequency (Hz)", ylabel="|y|")
stem!(ax5, f, abs.(z))
fig5

tol = 1e-6;
z[abs.(z) .< tol] .= 0
theta = angle.(z)

fig6 = Figure()
ax6 = Axis(fig6[1, 1], xlabel="Frequency (Hz)", ylabel="Phase/π")
stem!(ax6, f, theta./π)
fig6