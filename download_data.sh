#!/bin/bash


mkdir data
wget --no-check-certificate http://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R1.fastq.gz
wget --no-check-certificate http://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3335404/P7741_R2.fastq.gz
wget --no-check-certificate http://ftp.sra.ebi.ac.uk/vol1/run/ERR333/ERR3336325/all_minion.fastq.tar.gz


#move reads to data directory
mv P7741*.gz data/
