#!/bin/bash
#SBATCH --partition=batch
#SBATCH --ntasks=1
#SBATCH --time=6:00:00
#SBATCH --mem=10G
#SBATCH --job-name=fastqc
#SBATCH --output=%x.out
#SBATCH --error=%x.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

#load modules FastQC and MultiQC before running
module load FastQC
module load MultiQC

indir=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/ribo_output
outdir=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/fastQC_output


fastqc $indir/*.fq -o $outdir

multiqc $outdir/
