#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time= 48:00:00
#SBATCH --job-name=transdecoder
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=200G           
#SBATCH --threads-per-core=1
#SBATCH --output=transdecoder.out
#SBATCH --error=transdecoder.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

indir=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/trinity_output.Trinity.fasta

# load module 
module load TransDecoder/5.7.1-GCC-12.3.0

# ORF detection
TransDecoder.LongOrfs -t $indir

# prediction
TransDecoder.Predict -t $indir \
