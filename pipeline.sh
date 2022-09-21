#!/bin/bash
SECONDS=0

#Changing directory to the pipeline folder
cd /home/oluwasegun/pipeline

#To Run fastqc on the raw data
fastqc rawdata/demo.fastq -o rawdata/

#To perform trimming of the reads to remove poor base sequence
java -jar /home/oluwasegun/local/bin/trimmomatic-0.39.jar SE -threads 4 rawdata/demo.fastq rawdata/demo_trimmed.fastq TRAILING:10 -phred33
echo "trimmomatic finished running!"


#To run fastqc on the trimmed fastq file
fastqc rawdata/demo_trimmed.fastq -o rawdata/
echo "Fastqc finished running!"

#Aligment
hisat2 -q --rna-strandness R -x hisat/grch38/genome -U rawdata/demo_trimmed.fastq | samtools sort -o hisat/demo_trimmed.bam

#Running the feature counts on the trimmed bam file
featureCounts -S 2 -a ../gtf/Homo_sapiens.GRCh38.106.gtf -o quants/demo_featurecounts.txt hisat/demo_trimmed.bam


duration=$SECONDS
echo "$((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
