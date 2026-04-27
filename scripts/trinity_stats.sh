#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=24:00:00
#SBATCH --job-name=trinity_stats
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=100G           
#SBATCH --threads-per-core=1
#SBATCH --output=trinity_stats.out
#SBATCH --error=trinity_stats.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL

trinity_data=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/trinity_output.Trinity.fasta

module load Trinity/2.15.2-foss-2023a
$TRINITY_HOME/util/TrinityStats.pl $trinity_data > trinity_stats_output.txt