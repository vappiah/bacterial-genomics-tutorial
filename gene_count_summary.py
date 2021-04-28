import pandas as pd
import matplotlib.pyplot as plt
from matplotlib_venn import venn2, venn2_circles, venn2_unweighted
from matplotlib_venn import venn3, venn3_circles, venn3_unweighted
from matplotlib import pyplot as plt

import sys

lists=sys.argv[1:4]
gene_presence_absence=sys.argv[4]

group={'A':lists[0],'B':lists[1],'C':lists[2]}

subset={}


#order='A','B','AB','C','AC','BC','ABC'

def draw_venn(df):
#number of genes common to all three isolate
    all_=df[df['No. isolates']==3][lists]
    all_.dropna(inplace=True)
    common_to_all=all_.shape[0]

    #values common to all three isolates
    subset['ABC']=common_to_all

    data=[]

    for member in group.keys():
        isolate=group[member]
        unique=df[(df['No. isolates']==1) & (df[isolate].notnull())]
        data.append(unique.shape[0])
        subset[member]=unique.shape[0]
        

    subgroups=['AB','AC','BC']
 
    for subgroup in subgroups:
        member1=group[subgroup[0]]
        member2=group[subgroup[1]]
        common=df[(df['No. isolates']==2)][[member1,member2]]
        common.dropna(inplace=True)

        group[subgroup]=member1+'-'+member2
        subset[subgroup]=common.shape[0]


    #Prepare values for venn diagra. It should be in the order= A','B','AB','C','AC','BC','ABC'
    venn_values=[]
    
    
    #print(group.keys())

    for key in ['A','B','AB','C','AC','BC','ABC']:
        venn_values.append(subset[key])
        
    venn3_unweighted(subsets=venn_values,set_labels=(group['A'],group['B'],group['C']),alpha=0.7)
    plt.title('Gene Count')
    plt.savefig('gene_count_summary.png')
    print('figure saved')
    

try:

    df=pd.read_csv(gene_presence_absence)
    if 'Gene' not in df.columns:
        print('Gene list not found in file. Please specify the correct file')
    else:
        for isolate in lists:
            if isolate not in df.columns:
                print('%s not found in file. Please specify the correct file'%isolate)
                raise Exception
        
            
    
        draw_venn(df)
except:
    'Error has occured. Make sure you specified the correct file'
