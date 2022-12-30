#!/bin/bash
#
#SBATCH -p hpc-bio-lejeune
#SBATCH --chdir=/home/alumno08/lab4
#SBATCH -J kmers
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END    #END/START/NONE
#SBATCH --mail-user=soledad.arias@um.es

echo "Tiempo C++ longitud=13"
time ./kmer13
echo
echo "Tiempo python original longitud =13"
ipython kmer13-initial.ipynb
echo
echo "Tiempo python optimizado longitud=13"
ipython kmer13-solution.ipynb
echo
echo "Tiempo C++ longitud=14" 
time ./kmer14
echo
echo "Tiempo python original longitud=14"
ipython kmer14-initial.ipynb
echo
echo "Tiempo python optimizado longitud=14"
ipython kmer14-solution.ipynb
