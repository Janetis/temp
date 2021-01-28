#!perl
use strict;
use warnings;


	#######step6###arrange####
open my $fh,"../result/Co_result_samples226/Co_nr_taxon_20180417.txt" or die $!;
open my $out,">../result/Co_result_samples226/Co_nr_arrange_20180417.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split/\t/;
	$line[3] =~ s/Unclass.*/Unclassified/g;
	for my $i(0..2){
		print $out "$line[$i]\t";
	}
	print $out "$line[3]\n";
}

