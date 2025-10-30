#!/bin/bash
#MSUB -r eq_CUSTOM
#MSUB -q rome
#MSUB -A gen13385
#MSUB -m work
#MSUB -n 512
#MSUB -T 86400
#MSUB -c 4

module purge
module load intel/20.0.0 mpi/openmpi/ namd/2.13

ccc_mprun namd2 ++ppn 2 step4_equilibration.inp >& step4_equilibration.log
