##!/bin/bash

#PBS -N sickle
#PBS -o sickle_log.txt -e sickle_err.txt
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=12
source activate metagenomics-tutorial
cd /home/hpc/cychen/user/qmi000001/metagenomics-tutorial/data
mkdir trimmed_reads
#trim illumina reads using sickle
sickle pe -g -f P7741_R1.fastq.gz -r P7741_R2.fastq.gz -t sanger -o trimmed_reads/P7741_R1.fastq.gz -p trimmed_reads/P7741_R2.fastq.gz -s trimmed_reads/P7741_S.fastq.gz -q 20 -l 20



