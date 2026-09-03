#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=generate_db
#SBATCH --time=1-00:00:00
#SBATCH --output=slurm/generate_db.out
#SBATCH --error=slurm/generate_db.err
#SBATCH --cpus-per-task=8

FA=/projects/bgmp/shared/Bi623/Project2/campylomormyrus.fasta
# GFF=/projects/bgmp/shared/Bi623/Project2/campylomormyrus.gff
GTF=../star/campylomormyrus.gtf

STAR_DB=../star/campylomormyrus.STAR_2.7.11b

/usr/bin/time -v pixi run STAR \
    --runThreadN 8 \
    --runMode genomeGenerate \
    --genomeDir $STAR_DB \
    --genomeFastaFiles $FA \
    --sjdbGTFfile $GTF