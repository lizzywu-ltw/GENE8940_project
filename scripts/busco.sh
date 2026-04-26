#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=24:00:00
#SBATCH --job-name=busco
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=200G           
#SBATCH --threads-per-core=1
#SBATCH --output=busco.out
#SBATCH --error=busco.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

assembly=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/trinity_output.Trinity.fasta
module load BUSCO/6.0.0-conda

busco \
  -i $assembly \
  -l eukaryota_odb10 \
  -m transcriptome \
  -o busco_out

