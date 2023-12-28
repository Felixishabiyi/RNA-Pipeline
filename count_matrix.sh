#!/bin/bash

#Feature counts on the aligned file using feature counts
featureCounts -p -O -T 4 -a /home/oluwasegun/gtf/Homo_sapiens.GRCh38.106.gtf -o /home/oluwasegun/Downloads/align_bam/SRR_aligned.txt \
/home/oluwasegun/Downloads/align_bam/SRR_aligned.bam


