#!/bin/bash
#SBATCH --account=bgmp
#SBATCH --partition=bgmp
#SBATCH --job-name=htseq_count_4
#SBATCH --time=1-00:00:00
#SBATCH --output=slurm/htseq_count_4_%j.out
#SBATCH --error=slurm/htseq_count_4_%j.err
#SBATCH --cpus-per-task=8

SAM_08=alignment/SRR25030308Aligned.out.sam
SAM_94=alignment/SRR25030394Aligned.out.sam
GFF=/projects/bgmp/shared/Bi623/Project2/campylomormyrus.gff

RUN1_OUT=../htseq_count_out/SRR25030308.stranded.txt
RUN2_OUT=../htseq_count_out/SRR25030394.stranded.txt
RUN3_OUT=../htseq_count_out/SRR25030308.reversed.txt
RUN4_OUT=../htseq_count_out/SRR25030394.reversed.txt
## -------   --stranded=yes   ------- ####
# RUN 1 (SRR25630308)
# /usr/bin/time -v pixi run htseq-count --stranded=yes -i Parent $SAM_08 $GFF > $RUN1_OUT

# RUN 2 (SRR25630394)
# /usr/bin/time -v pixi run htseq-count --stranded=yes -i Parent $SAM_94 $GFF > $RUN2_OUT


## -------   --stranded=reverse   ------- ####
# RUN 3 (SRR25630308)
# /usr/bin/time -v pixi run htseq-count --stranded=reverse -i Parent $SAM_08 $GFF > $RUN3_OUT

# RUN 4 (SRR25630394)
/usr/bin/time -v pixi run htseq-count --stranded=reverse -i Parent $SAM_94 $GFF > $RUN4_OUT
