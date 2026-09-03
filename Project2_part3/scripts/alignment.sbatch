#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=alignment
#SBATCH --time=1-00:00:00
#SBATCH --output=slurm/alignment.out
#SBATCH --error=slurm/alignment.err
#SBATCH --cpus-per-task=8

#-------------#
# SRR25030308 #
#-------------#
# PREFIX=SRR25030308
# R1=../../Project2_part2/trimmomatic/SRR25630308/SRR25630308_1.paired.fastq.gz
# R2=../../Project2_part2/trimmomatic/SRR25630308/SRR25630308_2.paired.fastq.gz

#-------------#
# SRR25030394 #
#-------------#
PREFIX=SRR25030394
R1=../../Project2_part2/trimmomatic/SRR25630394/SRR25630394_1.paired.fastq.gz
R2=../../Project2_part2/trimmomatic/SRR25630394/SRR25630394_2.paired.fastq.gz


#-------------------------------------------------#

STAR_DB=../star/campylomormyrus.STAR_2.7.11b

# Run Star Alignment:
/usr/bin/time -v pixi run STAR --runThreadN 8 --runMode alignReads \
    --outFilterMultimapNmax 3 \
    --outSAMunmapped Within KeepPairs \
    --alignIntronMax 1000000 --alignMatesGapMax 1000000 \
    --readFilesCommand zcat \
    --readFilesIn $R1 $R2 \
    --genomeDir $STAR_DB \
    --outFileNamePrefix alignment/$PREFIX