#!/bin/bash

#SBATCH --job-name fastqc
#SBATCH -A evoanalysis  ## EDIT TO YOUR PROJECT
#SBATCH -t 1-00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=38
#SBATCH --mem=20G
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=sjohn208@uwyo.edu   # EDIT TO YOUR EMAIL
#SBATCH -e /project/evoanalysis/sjohn208/std/challenge3_%A_%a.err # EDIT TO YOUR DIRECTORY IN evoanalysis (or wherever else)
#SBATCH -o /project/evoanalysis/sjohn208/std/challenge3_%A_%a.out  # EDIT TO YOUR DIRECTORY IN evoanalysis (or wherever else)
#SBATCH --array=1-38    # EDIT BASED ON HOW MANY SAMPLES

#load fastqc
module load fastqc/0.12.1 

#change directory to trimmed data
cd /project/evoanalysis/d3challenge_fq

OUTDIR="/project/evoanalysis/sjohn208/fastq_to_vcf_exercise" # EDIT TO WHERE YOU WANT OUTPUT TO GO
# mkdir -p $OUTDIR (done already)

#assign all files samples, each of which is in its own directory into a bash array
allsamples=(*/)


# Use the SLURM_ARRAY_TASK_ID to select a single sample out of the bash array
#  I use ($SLURM_ARRAY_TASK_ID-1) because bash indexing starts at 
#     zero and this is easier for me to keep track of.
sample=${allsamples[($SLURM_ARRAY_TASK_ID-1)]}

# change to directory into sample and run fastqc 
cd $sample 
fastqc -t 38 -o $OUTDIR *fastq
