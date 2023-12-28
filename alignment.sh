#!/bin/bash

#Performing alignment on the trimmed fastq files
#the aligned file (a bam file) was extracted to the align_bam directory
hisat2 -q --rna-strandness FR -x /home/oluwasegun/pipeline/hisat/grch38/genome -1 /home/oluwasegun/Downloads/trimmed/SRR_forward_paired.fastq \
/home/oluwasegun/Downloads/trimmed/SRR_reverse_paired.fastq | samtools sort -o /home/oluwasegun/Downloads/align_bam/SRR_aligned.bam


