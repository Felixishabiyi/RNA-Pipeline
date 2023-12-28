#!/bin/bash

#To perform trimming on the fastq files in the SRR folder
java -jar /home/oluwasegun/local/bin/trimmomatic-0.39.jar PE /home/oluwasegun/Downloads/SRR/SRR15852399_1.fastq /home/oluwasegun/Downloads/SRR/SRR15852399_2.fastq \
/home/oluwasegun/Downloads/trimmed/SRR_forward_paired.fastq /home/oluwasegun/Downloads/trimmed/SRR_forward_unpaired.fastq /home/oluwasegun/Downloads/trimmed/SRR_reverse_paired.fastq \
/home/oluwasegun/Downloads/trimmed/SRR_reverse_unpaired.fastq ILLUMINACLIP:TruSeq3-PE.fa:2:30:10:2:True LEADING:3 TRAILING:3 MINLEN:36


#Navigate to the trimmed directory
cd /home/oluwasegun/Downloads/trimmed

#creating a QC_trimmed_Report
mkdir QC_trimmed_Report

#Quality control on the trimed fastq files
fastqc SRR_forward_paired.fastq SRR_reverse_paired.fastq -o QC_trimmed_Report

cd /home/oluwasegun/Downloads/trimmed/QC_trimmed_Report

#Running MultiQC on the fastqc report
multiqc .
