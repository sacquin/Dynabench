#!/bin/bash
#MSUB -r prod13_CUSTOM
#MSUB -q rome
#MSUB -A gen13385
#MSUB -m work
#MSUB -n 512
#MSUB -c 4
#MSUB -T 86400

module purge
module load intel/20.0.0 mpi/openmpi/ namd/2.13

fin=step5_production13.inp
fout=step5_production13.out

if ccc_mprun namd2 ++ppn 2 $fin > $fout ; then
	ccc_msub step5_production14.sh
else
	exit
fi
done
