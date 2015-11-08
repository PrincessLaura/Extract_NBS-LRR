#!/bin/bash

echo "Enter zipped fastq file 1 name and location, followed by [ENTER]:"
read fastq1
echo "Enter zipped fastq file 2 name and location, followed by [ENTER]:"
read fastq2
echo "Enter name and location of reference genome, followed by [ENTER]:"
read reference_genome_fasta

gunzip -c $fastq1 | sed 's/ /_/' > Processed_fastq1
gunzip -c $fastq2 | sed 's/ /_/' > Processed_fastq2
cat Processed_fastq1 Processed_fastq2 >> Processed_fastq

grep -A1 "^@HISEQ" Processed_fastq | sed '/^--$/d' > Processed_fasta
sed 's/@HISEQ/>@HISEQ/' Processed_fasta > fasta

formatdb -i $reference_genome_fasta -p F 

blastall -p blastn -i fasta -d $reference_genome_fasta -o Blast_out.txt -m 8 -e 0.00001

perl /pub9/laura/Filter_blast_output.pl Blast_out.txt > Blast_out_filter.txt 


perl /pub9/laura/Extract_fastq_reads_uaing_blast.pl Blast_out_filter.txt Processed_fastq1 > Output1.fastq
perl /pub9/laura/Extract_fastq_reads_uaing_blast.pl Blast_out_filter.txt Processed_fastq2 > Output2.fastq



