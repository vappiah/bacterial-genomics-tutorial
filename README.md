# Comparative-Analysis-of-Bacterial-genomes


#Installation instructionshttps://github.com/vappiah/bacterial-genomics
#- Download and install anaconda(version 3 recommended)
#Add channels
conda config --add channels conda-forge
conda config --add channels bioconda
conda config --add channels daler
conda config --add channels defaults

#Download the Analysis pipeline
git clone https://github.com/vappiah/bacterial-genomics.git

#Change directory to the dowloaded folder
cd bacterial-genomics

#Create conda environment. Packages are listed in the environment.yaml file 
conda env create -f environment.yaml

#Download the polishing tool pilon

mkdir apps

wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar -O apps/pilon.jar


#Activate environment

source activate bacterial-genomics

#add permission to all scripts
chmod +x *.{py,sh,pl}


#TIME FOR ANALYSIS

#Step 1: Download data

./download_data

#Perform de novo assembly using spades
./assemble.sh

#Polish the draft assembly using pilon. This is meant to improve the draft assembly. The scaffolds will be used
#You can also modify the script to use the contigs and compare the result 
./polish.sh

#Reorder contigs agains a reference genome using ragtag to generate a draft genome

./reorder_contigs.sh

#Perform a multi locus sequence typing using MLST software

./mlst.sh

#Check for antimicrobial resistance genes using abricate

./amr.sh


#Annotate the draft genome using prokka
./annotate.sh

#Get some statistics on the annotation. Features such as genes, CDS will be counted and displayed. The scripts requires you to specify the folder where annotations were saved . i.e. P7741
#Python should be used to run that script

python get_annotat_stats.sh P7741

#Generate dendogram
This Pipeline a collection of tools listed in the environment.yaml file to perform comparative bacterial genome analysis


Citation
You just have to declare a statement.
Analysis was done using scripts written by Vincent Appiah, University of Ghana
