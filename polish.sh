#!/bin/bash

#polishing illumina draft assembly using pilon

mkdir polished_assembly

#increase the number of threads if you have more cpu cores to make it run faster
threads=4

currdir=$(pwd)
pilon=$currdir/apps/pilon.jar
read1=$currdir/trimmed_reads/P7741_R1.fastq.gz
read2=$currdir/trimmed_reads/P7741_R2.fastq.gz  


mkdir polishing_process
cd polishing_process

echo "POLISING DRAFT ASSEMBLY"

echo "ROUND 1"

cp $currdir/P7741_SPADES_OUT/scaffolds.fasta ./raw_assembly.fasta
bwa index raw_assembly.fasta
bwa mem -t $threads raw_assembly.fasta $read1 $read2 | samtools view - -Sb |samtools sort - -@"threads" -o mapping1.sorted.bam
samtools index mapping1.sorted.bam
java -Xmx40G -jar  $pilon --genome raw_assembly.fasta --fix all --changes --frags mapping1.sorted.bam --threads $threads --output pilon_stage1|tee stage1.pilon


echo "Round2"

bwa index pilon_stage1.fasta
bwa mem -t $threads pilon_stage1.fasta $read1 $read2| samtools view - -Sb | samtools sort - -@"$threads" -o mapping2.sorted.bam
samtools index mapping2.sorted.bam
java -Xmx40G -jar $pilon --genome pilon_stage1.fasta --fix all --changes --frags mapping2.sorted.bam --threads $threads --output pilon_stage2 | tee stage2.pilon


echo "Round3"
bwa index pilon_stage2.fasta
bwa mem -t $threads pilon_stage2.fasta $read1 $read2| samtools view - -Sb | samtools sort - -@"$threads" -o mapping3.sorted.bam
samtools index mapping3.sorted.bam
java -Xmx40G -jar $pilon --genome pilon_stage2.fasta --fix all --changes --frags mapping3.sorted.bam --threads $threads --output pilon_stage3 | tee stage3.pilon



echo "Round4"
bwa index pilon_stage3.fasta
bwa mem -t $threads pilon_stage3.fasta $read1 $read2| samtools view - -Sb | samtools sort - -@"$threads" -o mapping4.sorted.bam
samtools index mapping4.sorted.bam
java -Xmx40G -jar $pilon --genome pilon_stage3.fasta --fix all --changes --frags mapping4.sorted.bam --threads $threads --output pilon_stage4 | tee stage4.pilon


cp pilon_stage4.fasta ../P7741.polished.fasta
cd ../
cat polishing_process/pilon_stage4.changes


