#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH -c 2
#SBATCH --job-name=jointGT  
#SBATCH --partition=day
#SBATCH --account=hpi001
#SBATCH --mem=8000
#SBATCH --time=24:00:00
#SBATCH --export=NONE

module load java
conda activate gatk4_pipeline

java -Dconfig.file=/group/hpi001/gatk/slurmCromwellGATK4/slurm.conf -jar /group/hpi001/gatk/slurmCromwellGATK4/cromwell-61.jar run /group/hpi001/gatk/slurmCromwellGATK4/Multisample_jointgt_GATK4.wdl \
   -i /group/hpi001/gatk/slurmCromwellGATK4/Multisample_jointgt_GATK4_inputs_hg38.json \
   -o /group/hpi001/gatk/slurmCromwellGATK4/cromwell.options
