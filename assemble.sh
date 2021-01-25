#!/bin/bash

#DE NOVO ASSEMBLY WITH SPADES
#THIS WORKFLOW USES ILLUMINA AND NANOPORE READS

#--nanopore trimmed_reads/P7741_minion.fastq
spades.py --isolate -o P7741_SPADES_OUT -1 trimmed_reads/P7741_R1.fastq -2 trimmed_reads/P7741_R2.fastq -s trimmed_reads/P7741_S.fastq 

