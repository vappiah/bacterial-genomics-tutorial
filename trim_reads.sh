##!/bin/bash

#trim nanopore reads using porechop
#porechop -i data/P7741_minion.fastq -o trimmed_reads/P7741_minion.fastq --format fastq -t 4



mkdir trimmed_reads

#trim illumina reads using sickle
sickle pe -g -f data/P7741_R1.fastq.gz -r data/P7741_R2.fastq.gz -t sanger -o trimmed_reads/P7741_R1.fastq.gz -p trimmed_reads/P7741_R2.fastq.gz -s trimmed_reads/P7741_S.fastq.gz -q 20 -l 20


#trim nanopore reads using porechop
#porechop -i data/P7741_minion.fastq -o trimmed_reads/P7741_minion.fastq --format fastq -t 4


