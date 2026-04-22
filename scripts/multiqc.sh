#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=8:00:00
#SBATCH --job-name=multiqc
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --output=multiqc_raw.out
#SBATCH --error=multiqc_raw.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

#load modules FastQC and MultiQC before running
module load FastQC/0.12.1-Java-11
module load MultiQC/1.28-foss-2024a

indir=/work/nclab/data/hawcofrag/25099FL_06_01_01
outdir=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/multiQC_output_raw


fastqc $indir/*.fastq.gz -o $outdir

multiqc $outdir/
