#!perl
use strict;
use warnings;

#########step3#########在batch entrez 里面选择taxonomy数据库，把文件Co_nr_first_taxid1.txt上传，在结果中下载XML文件####
###接下来解析xml文件#####
use XML::Simple qw(:strict);
use Data::Dumper;

open my $fh,"../result/Co_result_samples226/taxonomy_result_20180417.xml" or die $!;
open my $out,">../result/Co_result_samples226/Co_taxonomy_20180417.txt" or die $!;

my $content = XMLin($fh,keyAttr => {}, ForceArray => []);

for my $item(@{$content->{Taxon}}){
	print $out $item->{TaxId}."\t";
	print $out $item->{ScientificName}."\t";
	print $out $item->{Lineage}."\t";
	for my $sub(@{$item->{LineageEx}->{Taxon}}){
		print $out $sub->{Rank}."\t".$sub->{ScientificName}."\t";
	}
	print $out "\n";
	
}


