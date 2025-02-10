# A-Toy-example-for-using-GA-in-OPA-design
This repository contains MATLAB implementations of a Genetic Algorithm (GA) for optimizing sparse non-uniform optical phased arrays (OPA). The project uses the array thinning method to construct the antenna array and employs GA to optimize the performance of the array pattern. Following the classical GA flow, it includes roulette wheel selection, one-point crossover, and a simple inverse mutation operator. The main part of the project features two types of GA: one with elite selection and one without. To explore the variability of the results, you can choose the non-elite version or set the elite number to zero. The fitness function considers both PSLL, sparsity level, and space constraints. Additionally, it utilizes FFT to speed up the calculation of the array factor.

## File Descriptions
- `main.m` - Main script for running the GA optimization.
- `AF_fft.m` - Computes the array factor using FFT.
- `AF_grid.m` - Computes the array factor on a discrete grid.
- `Crossover.m` - Implements the one-point crossover operation for GA.
- `MutationSIM.m` - Implements the inverse mutation operation.
- `RWselection.m` - Implements roulette wheel selection.
- `fitnessFunctionSSP.m` - Fitness function considering PSLL, sparsity, and space constraints.
- `population.m` - Initializes the population for the GA.
- `population_minmax.m` - Initializes the population for the GA with minimum and maximum distance constraints.
- `PSLL.m` - Computes the Peak Sidelobe Level (PSLL).
- `test.m` - Testing script for verifying the functions.

