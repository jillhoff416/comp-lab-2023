#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=0:30:00
#SBATCH --mem=8gb
#SBATCH --job-name=single-prod
#SBATCH --output=single-prod.out

source /scratch/work/courses/CHEM-GA-2671-2023fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T0.9.lmp -var id 1 -in ../Inputs/production_3d_binary.lmp
