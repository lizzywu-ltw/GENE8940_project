#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=96:00:00
#SBATCH --job-name=trinity
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=20
#SBATCH --mem=100G           
#SBATCH --threads-per-core=1
#SBATCH --output=trinity.out
#SBATCH --error=trinity.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

# Load module
module load Trinity/2.15.2-foss-2023a

# Define LHS reads 
left_reads="/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/ribo_output/*R1.fq"

# Define RHS reads 
right_reads="/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/ribo_output/*R2.fq"

$TRINITY_DIR/Trinity --seqType fq \
--left $left_reads \
--right $right_reads \
--SS_lib_type RF \
--max_memory 2G \
--CPU 2 \
--output /work/nclab/lizzy/GENE8940_project/GENE8940_project-1/trinity_output