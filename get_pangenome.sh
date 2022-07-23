#!/bin/bash

#Pangenome analysis using roary and fasttree

#increase the number of threads if you have more cpu cores
threads=4

#Identify pangenomes
roary -f pangenome -p $threads -e -n -v --maft gffs/*.gff

#Generate alignment file
FastTree -nt -gtr pangenome/core_gene_alignment.aln > pangenome/mytree.newick

#Plot phylogenetic tree and generate svg format
python roary_plots.py --labels --format svg pangenome/mytree.newick pangenome/gene_presence_absence.csv

#Plot phylogenetic tree and generate image in png format
python roary_plots.py --labels pangenome/mytree.newick pangenome/gene_presence_absence.csv

#mv all plots to pangenome folder
mv pangenome_*.{svg,png} pangenome

echo "Pangeome analysis complete"
echo "Output: pangenome"
 

