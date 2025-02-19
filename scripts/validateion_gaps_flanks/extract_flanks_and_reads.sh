#!/bin/bash
if [ $# -lt 2 ]; then
	echo "Usage: $(basename $0) <scaffold path> <output directory> <NA12878 reads directory>"
	exit 1
fi

scaffold=$1;shift
out_dir=$1;shift
reads_dir=$1;shift

cp ${scaffold} ${out_dir}/gene-scaffolds.fa

perl fatoagp.pl -f gene-scaffolds-agp.fa ${out_dir}/gene-scaffolds.fa > ${out_dir}/gene-scaffolds.agp

#make bed from agp file
#chr start end linenumberfromfasta gapsize
awk '{if($5 == "N") print $1"\t"$2-1"\t"$3"\t"$4"\t"$6}' ${out_dir}/gene-scaffolds.agp | sed 's/scaffold//g' > ${out_dir}/gene-scaffolds_gaps.bed

#make genome file
samtools faidx ${out_dir}/gene-scaffolds.fa
awk '{print $1"\t"$2}' ${out_dir}/gene-scaffolds.fa.fai > ${out_dir}/gene-scaffolds.fa.genome

#expand regions to 500bp flanks
bedtools flank -b 500 -i ${out_dir}/gene-scaffolds_gaps.bed -g ${out_dir}/gene-scaffolds.fa.genome > ${out_dir}/gene-scaffolds_gaps_flanks.bed

#extract regions
bedtools getfasta -fi ${out_dir}/gene-scaffolds.fa -bed ${out_dir}/gene-scaffolds_gaps_flanks.bed > ${out_dir}/gene-scaffolds_gaps_flanks.fa

#build index for miBF
biobloommimaker -t 8 -p gene-scaffolds_gaps_flanks -S "110001100111000001110100110110100010011101 000001111100101110111000001011010100011110 011110001010110100000111011101001111100000 101110010001011011001011100000111001100011" ${out_dir}/gene-scaffolds_gaps_flanks.fa

#classify reads
biobloommicategorizer -i --fq -t 32 -f ${out_dir}/gene-scaffolds_gaps_flanks.bf -e <(pigz -cd ${reads_dir}/gap_gene_001.fastq.gz) <(pigz -cd ${reads_dir}/gap_gene_002.fastq.gz) | pigz -p 16 > ${out_dir}/gene_mappedSubset.fastq.gz
