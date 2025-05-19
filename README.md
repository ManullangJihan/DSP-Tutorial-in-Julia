# Digital Signal Processing (DSP) Tutorials in Julia

Welcome to the DSP Tutorials in Julia repository! This repository provides various examples and tutorials for Digital Signal Processing (DSP) using Julia.

## Project Structure

```
env/
matlab_example/
    01_fourier_transform.jl

Manifest.toml
Project.toml
```

## How to Use

1. Clone the repository.
2. Set up the Julia environment using the Project.toml and Manifest.toml files.
3. Explore the tutorials in each folder.

### Initialize Local Environment

The local environment is set up using the `activate_env.jl` file inside the `env` folder. Each tutorial script begins with the following line:

```julia
# Activate environment and install dependencies defined in Project.toml
include("../env/activate_env.jl")
```

## matlab_example

This folder contains Julia code converted from MATLAB examples, specifically demonstrating Fourier Transform techniques.

| Topic                                               | Source                                                            |
| --------------------------------------------------- | ----------------------------------------------------------------- |
| [Fourier Transform](./matlab_example/fourier_transform.jl) | [Source](https://www.mathworks.com/help/matlab/math/fourier-transforms.html)    |
| [Convolution Filter to Smooth Data](./matlab_example/smooth_data_with_convolution.jl) | [Source](https://www.mathworks.com/help/matlab/data_analysis/convolution-filter-to-smooth-data.html)    |
| [Analyzing Cyclical Data with FFT](./matlab_example/analyzing_cyclical_data_with_FFT.jl) | [Source](https://www.mathworks.com/help/matlab/math/using-fft.html)    |
| [Square Wave From Sine Waves](./matlab_example/square_wave_form_sin_wave.jl) | [Source](https://www.mathworks.com/help/matlab/math/square-wave-from-sine-waves.html)    |

Feel free to explore and enhance these tutorials. Contributions are welcome!
