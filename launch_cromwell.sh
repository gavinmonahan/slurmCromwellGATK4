#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH -c 2
#SBATCH --job-name=cromwelltest
#SBATCH --partition=day
#SBATCH --reservation=cromwell_test
#SBATCH --account=hpi001
#SBATCH --mem=16gb
#SBATCH --time=10:00:00
#SBATCH --export=NONE
#SBATCH --error=%j.%x.err
#SBATCH --output=%j.%x.out


module load java/1.8.0_311
source activate /home/gmonahan/.conda/envs/gatk4_pipeline/
which python

java -Dconfig.file=/group/hpi001/gatk/slurmCromwellGATK4/slurm.conf -jar /group/hpi001/gatk/cromwell-72.jar run /group/hpi001/gatk/slurmCromwellGATK4/Multisample_Fastq_to_Gvcf_GATK4.wdl \
   -i /group/hpi001/gatk/slurmCromwellGATK4/Multisample_Fastq_to_Gvcf_GATK4_inputs_hg38.json \
   -o /group/hpi001/gatk/slurmCromwellGATK4/cromwell.options
