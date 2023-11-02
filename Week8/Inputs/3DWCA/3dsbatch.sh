#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=1
#SBATCH --time=0:30:00
#SBATCH --mem=8gb
#SBATCH --job-name=lammps-density-loop
#SBATCH --output=lammps-density-loop.out

# Define the range of densities
start_density=0.8
end_density=1.5
density_step=0.1

# Loop through different densities and run simulations
current_density=$start_density
while (( $(bc <<< "$current_density <= $end_density") ))
do
    # Construct the log file name based on the density
    log_file="3d_density_${current_density}.log"
    
    # Run LAMMPS with the desired density and save the log to the log file
    mpirun lmp -var density $current_density -in 3dWCA.in -log "$log_file"
    
    # Increase the density for the next iteration
    current_density=$(bc <<< "$current_density + $density_step")
done
