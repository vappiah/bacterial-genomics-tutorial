import sys
from Bio import SeqIO
import os


features=['CDS','gene','tRNA', 'tmRNA', 'rRNA',]

directory=sys.argv[1]
prefix=sys.argv[2]

def get_stats(directory,prefix):
    #bname=os.path.split(directory)[-1]
    bname=prefix
    stats_dict={}

    genebank='%s/%s.gbk'%(directory,bname)
    
    data=[i for i in SeqIO.parse(genebank,"gb")][0]
 
    featurecount=lambda x:len([i for i in data.features if i.type==x])
    counts=[featurecount(feature) for feature in features]
    #print(counts)
    cds=[i for i in data.features if i.type=='CDS']

    #Getting information on Insertion Sequences
   
    insertion_sequences=[i.qualifiers['product'][0] for i in cds if 'IS' in ''.join(i.qualifiers['product'])[0:2]]
    insertion_sequence_names=list(set(insertion_sequences))

    #print(counts)

    
    for name in insertion_sequence_names:
        counts.append(insertion_sequences.count(name))
        features.append(name)
    counts.append(len(insertion_sequences))
    features.append('Insertion_Sequences')
    #print(list(set(insertion_sequences)))


    #count pseudogenes
    pseudo_gene_file='%s/%s.pseudo.txt'%(directory,bname)
    pseudo_count=len(open(pseudo_gene_file,'r').readlines())
    counts.append(pseudo_count)
    features.append('Pseudogenes')
    
    print('Counting Annotated Features.............................')
    for feature,count in zip(features,counts):
        print("%s:%d"%(feature,count))

  

get_stats(directory,prefix)
