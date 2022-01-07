#!/bin/bash -l
#SBATCH --job-name=hg38_download
#SBATCH --account=hpi001
#SBATCH --nodes=1
#SBATCH --time=05:00:00
#SBATCH --partition=day
#SBATCH --ntasks=1
#SBATCH --export=NONE

conda activate google-sdk

gsutil -m cp -r gs://genomics-public-data/references/hg38/v0 /group/hpi001/hg38
