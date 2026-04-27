#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=24:00:00
#SBATCH --job-name=exN50
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=200G           
#SBATCH --threads-per-core=1
#SBATCH --output=exN50.out
#SBATCH --error=exN50.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

# Load module
module load Trinity/2.15.2-foss-2023a

$TRINITY_HOME/util/misc/contig_ExN50_statistic.pl \
transcripts.TMM.EXPR.matrix trinity_output.Trinity.fasta transcript | tee ExN50.transcript.stats