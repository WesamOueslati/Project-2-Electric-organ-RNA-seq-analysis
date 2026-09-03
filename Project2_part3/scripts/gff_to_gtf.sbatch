#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=gtf_gff
#SBATCH --time=1-00:00:00
#SBATCH --output=slurm/gtf_gff.out
#SBATCH --error=slurm/gtf_gff.err
#SBATCH --cpus-per-task=8

GFF=/projects/bgmp/shared/Bi623/Project2/campylomormyrus.gff
GTF=../star/campylomormyrus.gtf

agat_convert_sp_gff2gtf.pl --gff $GFF -o $GTF