#!/bin/bash

## challenge3.sh by SPJ on 011426
## PURPOSE: practice slurm array setup by counting reads in a set of .fastq's
## USAGE: sbatch challenge3.sh

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

# count reads for the working file, store that in this new variable, read_count
read_count=$(grep -c "^@" "$work_file")

# now, print the working file name, and the read count (tab delimited), and write that to
# the output file that corresponds to the working .fastq name

# note: echo's -e option is what allows you to use the \t delimiter (escape sequence) 
# this %.fastq also removes the .fastq string from work_file when creating the output name

echo -e "${work_file}\t${read_count}" > /p"readcount_${work_file%.fastq}.txt"

# then you can cat *.txt from the challenge3 dir and it'll show the reads for each file

# cp'd just the output (.txt files) to the git repo. didn't want to push data up there.




