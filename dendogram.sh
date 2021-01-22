#!/bin/bash


mkdir tmp_fastas
cp genomes/*.fasta tmp_fastas
cp P7741.reordered.fasta tmp_fastas/
mkdir dendogram
dRep compare dendogram -g tmp_fastas/*.fasta
rm -fr tmp_fastas

echo "dendogram generated"
echo "output: ./dendogram"
