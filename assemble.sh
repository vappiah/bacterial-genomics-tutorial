#!/bin/bash

#DE NOVO ASSEMBLY WITH SPADES
#THIS WORKFLOW USES ILLUMINA AND NANOPORE READS

#--nanopore trimmed_reads/P7741_minion.fastq
#spades.py --isolate -o P7741_SPADES_OUT -1 trimmed_reads/P7741_R1.fastq.gz -2 trimmed_reads/P7741_R2.fastq.gz -s trimmed_reads/P7741_S.fastq.gz --nanopore trimmed_reads/P7741_minion.fastq

spades.py --careful -o P7741_SPADES_OUT -1 trimmed_reads/P7741_R1.fastq.gz -2 trimmed_reads/P7741_R2.fastq.gz -s trimmed_reads/P7741_S.fastq.gz
