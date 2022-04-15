# Comparative-Analysis-of-Bacterial-genomes
Bioinformatics analysis can be challenging especially for new entrants. The purpose of this repo is to provide scripts that one can quickly use to perform comparative analysis of bacterial genomes. The scripts have been designed to automate majority of tasks so that beginners can get their hands dirty without having to struggle to assemble and use the analysis tools

More bioinformatics tutorials can be found on my youtube channel: https://www.youtube.com/channel/UCOJM9xzqDc6-43j2x_vXqCQ \
[You can buy me a coffee: https://www.buymeacoffee.com/bioinfocoach] \
Here is a playlist for bacterial genome analysis: https://www.youtube.com/playlist?list=PLe1-kjuYBZ074A06NOuO9rXCTD3ddoOyz


## Support My Work
[Buy Me a Coffee](https://www.buymeacoffee.com/informatician)


# Download and install anaconda(version 3 recommended)

### Add channels

```
conda config --add channels conda-forge\
conda config --add channels bioconda\
conda config --add channels daler\
conda config --add channels defaults\
```

### Download the Analysis pipeline

```
git clone https://github.com/vappiah/bacterial-genomics-tutorial.git
```

### Change directory to the dowloaded folder

```
cd bacterial-genomics-tutorial
```

### Create conda environment.Packages are listed in the environment.yaml file. 

```
conda env create -f environment.yaml
```

### Download the polishing tool pilon

```
mkdir apps\
wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar -O apps/pilon.jar
```

### Activate the analysis environment
```
source activate bacterial-genomics-tutorial
```

### Add permission to all scripts
```
chmod +x *.{py,sh,pl}
```

### Install python packages using pip
```
pip install -r pip-requirements.txt
```

## TIME FOR ANALYSIS

### Step 1: Download data. 
```
./download_data.sh
```

### Step 2: Perform QC on the raw reads
```
./qc_raw_reads.sh
```
### Step 3: Trim reads using sickle
```
./trim_reads.sh
```
### Step 4: Perform QC on the trimmed reads

``` ./qc_trimmed_reads.sh```

### Step 5: Perform de novo assembly using spades
```
./assemble.sh
```
### Step 6 : Polish the draft assembly using pilon 
This is meant to improve the draft assembly. The scaffolds will be used. You can also modify the script to use the contigs and compare the result 
```
./polish.sh
```
### Step 7: Perform QC for both raw assembly and polished assembly
```
./qc_assembly.sh
```

### Step 8: Generate draft genome by reordering contigs against a reference genome using ragtag\
```
./reorder_contigs.sh
```
### Step 9: Perform a multi locus sequence typing using MLST software\
```
./mlst.sh
```
### Step 10: Check for antimicrobial resistance genes using abricate\
```
./amr.sh
```
### Step 11: Annotate the draft genome using prokka
```
./annotate.sh
```
### Step 12: Get some statistics on the annotation. 
Features such as genes, CDS will be counted and displayed. The scripts requires you to specify the folder where annotations were saved . i.e. P7741
Python should be used to run that script

``` python get_annot_stats.py P7741_annotation P7741``` 

### Step 13: Generate dendogram using dREP\
``` ./dendogram.sh ```

### Step 14: Perform Pangenome Analysis using Roary. 
Input files are gff (version 3 ) format. It is recommended to use prokka generated gff. So we generate the gffs for the files in the genome folder by reannotating with prokka. We use the get_genome_gffs script \
```./get_genome_gffs.sh ```

Then perform pangenome analysis\
``` 
./get_pangenome.sh
```

### Step 15: Get gene summary for three of the organism. the default is P7741 Agy99 and Liflandii. Feel free to change it. A venn diagram will be generated(gene_count_summary.png)

```python gene_count_summary.py P7741 Agy99 Liflandii pangenome/gene_presence_absence.csv```


If you are working on a cluster you will want to combine the analysis results into a zip file for download and view locally. 
```./zip_results.sh```


### Step 16: Compare your draft genome with the other organisms in the genomes folder by generating circular structures for them . Use the tutorial here to guide you https://youtu.be/pobQgE4z-5Q


### Step 17: Result interpretation
The result interpretation are available on my youtube video tutorial : https://youtu.be/S_sRo_85jhs

Now that you have been able to perform a bacterial comparative genome analysis. Its time to apply your skills on a real world data.
Good luck and see you next time

### Citation
Vincent Appiah, 2020.  Bacterial Genomics Tutorial  https://github.com/vappiah/bacterial-genomics-tutorial

or

Vincent Appiah,2020. Youtube https://youtu.be/S_sRo_85jhs
