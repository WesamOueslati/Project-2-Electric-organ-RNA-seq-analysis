#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=download_fqs
#SBATCH --error=download.err
#SBATCH --time=1-00:00:00

SRR25630308	WesamOuslati
SRR25630394


SRR1=SRR25630308
SRR2=SRR25630394

# Files save to current directory
vdb-config --prefetch-to-cwd

# Check accession size
# vdb-dump SRR11722023 -info

prefetch $SRR1 --max-size u
prefetch $SRR2 --max-size u 

fasterq-dump $SRR1
fasterq-dump $SRR2


