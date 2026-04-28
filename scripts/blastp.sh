#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=24:00:00
#SBATCH --job-name=blastp
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=200G           
#SBATCH --threads-per-core=1
#SBATCH --output=blastp.out
#SBATCH --error=blastp.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

# load module 
 module load BLAST+/2.17.0-gompi-2025a
 module load ncbiblastdb/20260203

pep=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/scripts/transdecoder.pep
blastp -query $pep \
       -db swissprot \
       -out blastp.outfmt6 \
       -evalue 1e-5 \
       -num_threads 8 \
       -outfmt 6