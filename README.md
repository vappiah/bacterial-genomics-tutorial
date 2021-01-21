# Comparative-Analysis-of-Bacterial-genomes


Installation instructionshttps://github.com/vappiah/bacterial-genomics
- Download and install anaconda(version 3 recommended)
Add channels
- conda config --add channels conda-forge
- conda config --add channels bioconda
- conda config --add channels daler

git clone https://github.com/vappiah/bacterial-genomics.git
cd bacterial-genomics
conda env create -f environment.yaml

Download the polishing tool 
wget https://github.com/broadinstitute/pilon/releases/download/v1.23/pilon-1.23.jar -O pilon.jar
Activate environment
source activate bacterial-genomics


This Pipeline a collection of tools listed in the environment.yaml file to perform comparative bacterial genome analysis


Citation
You just have to declare a statement.
Analysis was done using scripts written by Vincent Appiah, University of Ghana
