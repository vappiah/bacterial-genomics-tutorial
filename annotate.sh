#!/bin/bash
#PBS -N prokka
#PBS -o prokka_log.txt -e prokka_err.txt
#PBS -l walltime=1:00:00
#PBS -l nodes=1:ppn=12
source activate metagenomics-tutorial
cd /home/hpc/cychen/user/<username>/week4/metagenomics-tutorial
#Genome annotation using prokka
#if you have more cpus you can increase the number of cpus
cpus=4
 
prokka --cpus $cpus --kingdom Bacteria --locustag P7741 --outdir P7741_annotation --prefix P7741 --addgenes P7741.reordered.fasta

