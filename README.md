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

## Tutorials

| Topic                                               | Source                                                            |
| --------------------------------------------------- | ----------------------------------------------------------------- |
| [Fourier Transform](./matlab_example/01_.jl) | [Source](https://www.mathworks.com/help/matlab/math/fourier-transforms.html)    |


Feel free to explore and enhance these tutorials. Contributions are welcome!