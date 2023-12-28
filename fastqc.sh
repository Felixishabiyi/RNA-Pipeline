#!/bin/bash

#To perform quality control (fastqc) on the files in the SRR directory
#The output was extracted to the FastQC_Rep directory

cd /home/oluwasegun/Downloads/SRR

fastqc SRR15852399_1.fastq SRR15852399_2.fastq -o ../FastQC_Rep

