#!/bin/bash
#SBATCH --partition=batch
#SBATCH --job-name=R_analysis
#SBATCH --cpus-per-task=4
#SBATCH --mem=20G
#SBATCH --time=2:00:00
#SBATCH --ntasks=1
#SBATCH --output=R_analysis.out
#SBATCH --error=R_analysis.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

export R_LIBS_USER=/home/etw33155/R/x86_64-pc-linux-gnu-library/4.5

module load R/4.5.1-gfbf-2025a

Rscript analysis.R