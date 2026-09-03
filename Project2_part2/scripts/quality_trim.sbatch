#!/bin/bash

#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=trimmomatic
#SBATCH --time=1-00:00:00
#SBATCH --output=slurm/trim.out
#SBATCH --error=slurm/trim.err
#SBATCH --cpus-per-task=8


#    SRR25630308
#R1=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmed/SRR25630308_1_trimmed.fastq
#R2=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmed/SRR25630308_2_trimmed.fastq

#R1_PAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630308_1.paired.fastq.gz
#R2_PAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630308_2.paired.fastq.gz

#R1_UNPAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630308_1.unpaired.fastq.gz
#R2_UNPAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630308_2.unpaired.fastq.gz


#    SRR25630394
R1=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmed/SRR25630394_1_trimmed.fastq
R2=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmed/SRR25630394_2_trimmed.fastq

R1_PAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630394_1.paired.fastq.gz
R2_PAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630394_2.paired.fastq.gz

R1_UNPAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630394_1.unpaired.fastq.gz
R2_UNPAIRED_OUT=/projects/bgmp/oueslati/projects/Project-2-Electric-organ-RNA-seq-analysis/Project2_part2/trimmomatic/SRR25630394_2.unpaired.fastq.gz



/usr/bin/time -v pixi run trimmomatic PE -threads 4 \
    $R1 $R2 \
    $R1_PAIRED_OUT $R1_UNPAIRED_OUT \
    $R2_PAIRED_OUT $R2_UNPAIRED_OUT \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:5:15 MINLEN:35
