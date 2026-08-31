#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --error=slurm/zipping.err
#SBATCH --output=slurm/zipping.out
#SBATCH --cpus-per-task=16
#SBATCH --time=1-00:00:00

ls -1 *.fastq | while read line
    do pigz $line
done
