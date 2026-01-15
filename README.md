# EvoAnalysis_S26

Here's where I'll put info and usages for assignments.

## Challenge 3 - Counting .fastq reads using a slurm job array

Run this script to extract the number of reads from a collection of .fastq files, and to place ouptut from each .fastq into a .txt file that corresponds to the name of the .fastq.

``` 
sbatch EvoAnalysis_S26/slurms/challenge3.sh
```

See comments within the script for functionality, see outupt in: 

```
/project/evoanalysis/sjohn208/EvoAnalysis_S26/challenge3_output
```

## Day 4 Work - Going from .fastq to .vcf

Fastqc as an array:

```
module load fastqc/0.12.1
sbatch fastqcarray.sh
```

to generate the multiqc report for each of those...

```
module load multiqc/1.24.1
# cd to directory of fastqc reports
multiqc .
```




