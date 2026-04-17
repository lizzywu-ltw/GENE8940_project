#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=6:00:00
#SBATCH --job-name=multiqc
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --output=multiqc.out
#SBATCH --error=multiqc.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

#load modules FastQC and MultiQC before running
module load FastQC/0.12.1-Java-11
module load MultiQC/1.28-foss-2024a

indir=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/ribo_output
outdir=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/multiQC_output


fastqc $indir/*.fq -o $outdir

multiqc $outdir/
