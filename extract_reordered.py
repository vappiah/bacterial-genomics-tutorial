
import sys
from Bio.SeqUtils import GC
from Bio import SeqIO

fastafile=sys.argv[1]
ID=sys.argv[2]

#read fasta file
allseq=[i for i in SeqIO.parse(fastafile,'fasta')]

#extract sequence with the RagTag label
reordered=[i for i in allseq if 'RagTag' in i.id and ID in i.id][0]

reordered.id='P7741'
reordered.name=''
reordered.description=''
gc=reordered.seq.count('G')+ reordered.seq.count('C')
gc_percent=GC(reordered.seq) 
sequence_length=len(reordered.seq)


print('Sequence Length: %d bp'%sequence_length)
print('GC Percent: %0.2f'%gc_percent)

SeqIO.write(reordered,'P7741.reordered.fasta','fasta')

print('draft genome sequence extracted')


