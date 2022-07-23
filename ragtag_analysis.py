import sys
from Bio import SeqIO
import os
import glob
from Bio.SeqUtils import GC
directory=sys.argv[1]

file_=sys.argv[1]
genome_id=sys.argv[2]

genome=[i for i in SeqIO.parse(file_,"fasta") if "_RagTag" in i.id and genome_id in i.id][0]

genome.name=''
genome.description=''
gc_genome=genome.seq.count('G')+ genome.seq.count('C')
gc_genome_percent=GC(genome.seq) 
sequence_length=len(genome.seq)

SeqIO.write(genome,'MU45.fasta',"fasta")

print('scaffold has been saved')
print('Sequence Length: %d bp'%sequence_length)
print('GC Percent: %0.2f'%gc_genome_percent)

