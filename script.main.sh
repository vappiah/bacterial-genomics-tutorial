#!/bin/bash

#Download illumina paired-end reads
wget http://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R1.fastq.gz
wget http://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R2.fastq.gz


#Downlaod nanopore reads reads
wget http://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3336325/all_minion.fastq.tar.gz


#Perform De novo assembly with spades
spades.py --careful -o SPADES_OUT -1 P7741_R1.fastq.gz -2 P7741_R2.fastq.gz --nanopore all_minion.fastq.tar.gz

#Perform reference guided scaffolding with RagTag
#Agy99 fasta can be downloaded from this link https://www.ncbi.nlm.nih.gov/nuccore/CP000325
ragtag.py scaffold Agy99.fasta SPADES_OUT/contigs.fasta -o ragtag_output

#extract the newly generated scaffold to a seperate file called MU45.fasta
python ragtag_analysis.py ragtag_output/ragtag.scaffolds.fasta CP000325.1
