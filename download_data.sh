#!/bin/bash


mkdir data
wget --no-check-certificate ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R1.fastq.gz
wget --no-check-certificate ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R2.fastq.gz


#wget s3://sra-pub-src-17/ERR3335404/P7741_R1.fastq.gz.1 -O P7741_R1.fastq.gz
#wget s3://sra-pub-src-17/ERR3335404/P7741_R2.fastq.gz.1 -O P7741_R2.fastq.gz
#move reads to data directory
mv P7741*.gz data/
