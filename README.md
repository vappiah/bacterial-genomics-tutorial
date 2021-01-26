# Comparative-Analysis-of-Bacterial-genomes


#- Download and install anaconda(version 3 recommended)

#Add channels

conda config --add channels conda-forge

conda config --add channels bioconda

conda config --add channels daler

conda config --add channels defaults

#Download the Analysis pipeline

git clone https://github.com/vappiah/bacterial-genomics-tutorial.git

#Change directory to the dowloaded folder

cd bacterial-genomics-tutorial

#Create conda environment. Packages are listed in the environment.yaml file --quiet flag is used so that conda installs packages without confirmation. 

conda env create --quiet -f environment.yaml

#Download the polishing tool pilon

mkdir apps

wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar -O apps/pilon.jar


#Activate environment

source activate bacterial-genomics-tutorial

#add permission to all scripts

chmod +x *.{py,sh,pl}

#Install python packages using pip

pip install -r pip-requirements.txt

#TIME FOR ANALYSIS

#Step 1: Download data. W

./download_data.sh

#Perform de novo assembly using spades

./assemble.sh

#Polish the draft assembly using pilon. This is meant to improve the draft assembly. The scaffolds will be used
#You can also modify the script to use the contigs and compare the result 

./polish.sh

#Perform QC for both raw assembly and polished assembly

./qc_assembly.sh

#Generate draft genome by reordering contigs against a reference genome using ragtag

./reorder_contigs.sh

#Perform a multi locus sequence typing using MLST software

./mlst.sh

#Check for antimicrobial resistance genes using abricate

./amr.sh

#Annotate the draft genome using prokka

./annotate.sh

#Get some statistics on the annotation. Features such as genes, CDS will be counted and displayed. The scripts requires you to specify the folder where annotations were saved . i.e. P7741

#Python should be used to run that script

python get_annot_stats.py P7741_annotation P7741

#Generate dendogram using dREP

./dendogram.sh

#Perform Pangenome Analysis using Roary. Input files are gff (version 3 ) format. It is recommended to use prokka generated gff

#So we generate the gffs for the files in the genome folder by reannotating with prokka. We use the get_genome_gffs script

./get_genome_gffs.sh

#then perform pangenome analysis

./get_pangenome.sh

#get gene summary for three of the organism. the default is P7741 Agy99 and Liflandii. Feel free to change it. A venn diagram will be generated(gene_count_summary.jpg)

python gene_count_summary.py P7741 Agy99 Liflandii pangenome/gene_presence_absence.csv

#If you are working on a cluster you will want to combine the analysis results into a zip file for download and view locally. 
./zip_results.sh

#Compare your draft genome with the other organisms in the genomes folder by generating circular structures for them . Use the tutorial here to guide you https://youtu.be/pobQgE4z-5Q

#Now that you have been able to perform a bacterial comparative genome analysis. Its time to apply your skills on a real world data.
#Good luck and see you next time

Citation
You just have to declare a statement.
Analysis was done using scripts written by Vincent Appiah, University of Ghana
