#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=2:00:00
#SBATCH --mem=8gb
#SBATCH --job-name=lammps-cool
#SBATCH --output=lammps-cool.out
#SBATCH --array=1-10

source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

temps=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475)

for current in "${temps[@]}"; do
   mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T${current}.lmp -var id 1 -in ../Inputs/anneal_3d_binary.lmp
done
