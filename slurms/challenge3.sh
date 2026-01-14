#!/bin/bash

#SBATCH --job-name=countreads
#SBATCH --account=evoanalysis
#SBATCH --time=12:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH -o /project/evoanalysis/sjohn208/std/challenge3_%A_%a.out
#SBATCH -e /project/evoanalysis/sjohn208/std/challenge3_%A_%a.err
#SBATCH --mail-type=END
#SBATCH --array=1-38

# ls *.fastq | wc -l
# 38 files in the dir

cd /project/evoanalysis/sjohn208/challenge3

# get all files ending w/ .fastq into the array
files=(*.fastq)

# specify the working file using bash indexing
work_file=${files[($SLURM_ARRAY_TASK_ID-1)]}

# count reads for the working file, store that outuput in a new file corresponding to the 
# name of the working .fastq
grep -c "^@" "$work_file" > "readcount_${work_file}.txt"









