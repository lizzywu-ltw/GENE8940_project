#!/bin/bash
#SBATCH --partition=batch
#SBATCH --time=96:00:00
#SBATCH --job-name=salmon
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=200G           
#SBATCH --threads-per-core=1
#SBATCH --output=salmon.out
#SBATCH --error=salmon.err
#SBATCH --mail-user=etw33155@uga.edu
#SBATCH --mail-type=END,FAIL


indir=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/ribo_output
assembly=/work/nclab/lizzy/GENE8940_project/GENE8940_project-1/trinity_output.Trinity.fasta
mkdir -p salmon_out

# load modules
module load Trinity/2.15.2-foss-2023a
module load Salmon/1.10.3-GCC-12.3.0
module load BUSCO/6.0.0-conda

# create index
salmon index \
  -t $assembly \
  -i trinity_index

# quantify reads 
for R1 in $indir/*.R1.fq
do
    R2=$(echo "$R1" | sed 's/.R1./.R2./')
    SAMPLE=$(basename "$R1" | sed 's/.R1.fq//')

    salmon quant \
      -i trinity_index \
      -l A \
      -1 $R1 \
      -2 $R2 \
      -p 8 \
      --validateMappings \
      -o salmon_out/${SAMPLE}
done

# quality stats with Trinity
$TRINITY_HOME/util/TrinityStats.pl $assembly > trinity_stats.txt

# quality assessment with Busco 
busco \
  -i $assembly \
  -l eukaryota_odb10 \
  -m transcriptome \
  -o busco_out