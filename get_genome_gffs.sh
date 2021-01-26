#!/bin/bash


genomes=(genomes/*.fasta)
mkdir gffs

for genome in Agy99 Liflandii SGL03 Shinsuense H37Rv 
do
prokka --kingdom Bacteria --locustag ${genome} --addgenes --prefix ${genome} genomes/${genome}.fasta
cp ${genome}/${genome}.gff gffs/
rm -fr ${genome}
done

cp P7741_annotation/P7741.gff gffs/

