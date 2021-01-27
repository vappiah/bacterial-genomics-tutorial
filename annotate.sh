#!/bin/bash
#Genome annotation using prokka

#if you have more cpus you can increase the number of cpus
cpus=4

prokka --cpus $cpus --kingdom Bacteria --locustag P7741 --outdir P7741_annotation --prefix P7741 --addgenes P7741.reordered.fasta
./get_pseudo.pl P7741_annotation/P7741.faa | tee P7741_annotation/P7741.pseudo.txt
