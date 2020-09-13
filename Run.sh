#!/bin/bash

#SBATCH -A snic2020-15-186
#SBATCH -p core
#SBATCH -n 15
#SBATCH -t 15:00:00
#SBATCH -J LinusTrinity


cd $TMPDIR
mkdir LinusData
cp /proj/snic2020-15-186/LinusBenchmark/data/HomoSap/Large1_ENCSR362HMX/sample1/homosapLarge1Left.fastq.gz LinusData
cp /proj/snic2020-15-186/LinusBenchmark/data/HomoSap/Large1_ENCSR362HMX/sample1/homosapLarge2Right.fastq.gz LinusData
cd LinusData
gunzip *

singularity exec /proj/snic2020-15-186/LinusBenchmark/Containers/trinity_latest.sif Trinity --seqType fq --max_memory 96G --CPU 15  --left /scratch/LinusData/homosapLarge1Left.fastq --right /scratch/LinusData/homosapLarge2Right.fastq --output $TMPDIR/outputTrinity/

cp $TMPDIR/outputTrinity/Trinity.fasta /proj/snic2020-15-186/LinusBenchmark/output/trinity/HomoSap/Large1/sample1/outputTrinity/

