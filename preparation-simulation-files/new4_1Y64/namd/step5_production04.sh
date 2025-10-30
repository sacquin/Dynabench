#!/bin/bash
#MSUB -r prod04_1Y64
#MSUB -q rome
#MSUB -A gen16135
#MSUB -m scratch
#MSUB -N 8
#MSUB -n 512
#MSUB -x
#MSUB -T 86400

module purge
#module load intel/20.0.0 mpi/openmpi/ namd/2.13
module load gnu/8 mpi/openmpi/4 flavor/namd/fullMPI namd/2.14


fin=step5_production04.inp
fout=step5_production04.out

if ccc_mprun namd2 ++ppn 2 $fin > $fout ; then
	ccc_msub step5_production11.sh
else
	exit
fi
done
