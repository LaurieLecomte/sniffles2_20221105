#!/bin/bash 

# Testing Sniffles2 in sniffles conda env 
# srun -p small --mem=20G -c 1 -J 02_combined_calling -o log/02_combined_calling_%j.log /bin/sh 01_scripts/02_combined_calling.sh &

# VARIABLES
BAM_DIR="04_bam"
GENOME="03_genome/genome.fasta"
OUT_DIR="05_calls"

CALLS_DIR="05_calls"
SAMPLE_LIST="02_infos/ind_ONT.txt"

SNF_FILES=$(ls $CALLS_DIR/*.snf)

MERGED_DIR="06_merged"
OUTPUT="$MERGED_DIR/combined_calling_no_lowconf.vcf"



# 1. Run sniffles combined calling
sniffles --input $SNF_FILES --vcf $OUTPUT --combine-low-confidence-abs 0 --allow-overwrite
