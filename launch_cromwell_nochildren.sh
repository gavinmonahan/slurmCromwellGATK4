#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH -c 36
#SBATCH --job-name=cromwelltest_wes
#SBATCH --partition=day
#SBATCH --account=hpi001
#SBATCH --mem=256gb
#SBATCH --time=6:00:00
#SBATCH --export=NONE
#SBATCH --mail-user=gavin.monahan@perkins.org.au
#SBATCH --mail-type=END
#SBATCH --error=%j.%x.err
#SBATCH --output=%j.%x.out


module load java/11.0.12
source activate /home/gmonahan/.conda/envs/gatk4_pipeline/
which python

java -Dconfig.file=/group/hpi001/gatk/slurmCromwellGATK4/slurm_nochildren.conf -jar /group/hpi001/gatk/cromwell-72.jar run /group/hpi001/gatk/slurmCromwellGATK4/Multisample_Fastq_to_Gvcf_GATK4.wdl \
   -i /group/hpi001/gatk/slurmCromwellGATK4/Multisample_Fastq_to_Gvcf_GATK4_inputs_hg38.json \
   -o /group/hpi001/gatk/slurmCromwellGATK4/cromwell.options
