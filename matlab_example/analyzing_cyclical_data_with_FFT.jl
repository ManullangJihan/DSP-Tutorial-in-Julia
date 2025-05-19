# Activate environment and install dependencies defined in Project.toml
include("../env/activate_env.jl")

using DataFrames
using FFTW
using LinearAlgebra
using Plots
using Plots: plot, plot!
using CSV

function dat2csv(dat_path::AbstractString, csv_path::AbstractString)
    open(csv_path, write=true) do io
        for line in eachline(dat_path)
            join(io, split(line), ',')
            println(io)
        end
    end
    return csv_path
end

function dat2csv(dat_path::AbstractString)
    base, ext = splitext(dat_path)
    ext == ".dat" ||
        throw(ArgumentError("file name doesn't end with `.dat`"))
    return dat2csv(dat_path, "$base.csv")
end

# dat2csv("data/sunspot.dat")
df = DataFrame(CSV.File("data/sunspot.csv"; header=["Year", "Sunspot"]))
plot(df[:, "Year"], df[:, "Sunspot"], xlabel="Year", ylabel="Zurich Number", legend=false)

plot(df[1:50, "Year"], df[1:50, "Sunspot"], xlabel="Year", ylabel="Zurich Number", legend=false)

y = fft(df[:, "Sunspot"])
scatter(real.(y), imag.(y), xlim=(-2500, 2500), ylim=(-4000, 3000), legend=false)

n = length(y)
idx = Int(floor(n/2))
power = abs.(y[1:idx]).^2               # power of first half of transform data
maxfreq = 1/2                           # maximum frequency
freq = (1:idx) ./ (n/2) * maxfreq       # equally spaced frequency grid
plot(freq, power, xlim=(0.0, 0.5), xlabel="Cycles/Year", ylabel="Power", legend=false)

period = 1 ./ freq
plot(period, power, xlim=(0, 50), xlabel="Years/Cycle", ylabel="Power", legend=false)