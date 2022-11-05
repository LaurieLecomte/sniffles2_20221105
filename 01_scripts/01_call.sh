#!/bin/bash 

# Testing Sniffles2 in sniffles conda env 
# parallel -a 02_infos/ind_ONT.txt -j 4 srun -p medium --time=7:00:00 -c 1 -J 01_call_{} --mem=10G -o log/01_call_{}_%j.log /bin/sh 01_scripts/01_call.sh {} &

# VARIABLES
SAMPLE=$1
BAM_DIR="04_bam"
BAM_FILE="$BAM_DIR/"$SAMPLE".sorted.bam"
GENOME="03_genome/genome.fasta"
CALLS_DIR="05_calls"


# 1. Run sniffles
sniffles --input $BAM_FILE --vcf $CALLS_DIR/"$SAMPLE".vcf --snf $CALLS_DIR/"$SAMPLE".snf --minsvlen 30 --reference $GENOME --sample-id $SAMPLE --output-rnames --threads 1

#sniffles -m $BAM_FILE -v $OUT_DIR/"$SAMPLE".vcf -l 50 -s 7 -n -1




