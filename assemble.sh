#!/bin/bash
#PBS -N spades
#PBS -o spades_log.txt -e spades_err.txt
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=12
source activate metagenomics-tutorial
cd /home/hpc/cychen/user/qmi000001/week4/metagenomics-tutorial
 
spades.py --careful -o P7741_SPADES_OUT -1 trimmed_reads/P7741_R1.fastq.gz -2 trimmed_reads/P7741_R2.fastq.gz -s trimmed_reads/P7741_S.fastq.gz
