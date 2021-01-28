#!perl
use strict;
use warnings;


	

	
	#######step7###arrange####
open my $fh,"../result/Ni_result_samples226/Ni_nr_arrange_20180417.txt" or die $!;
open my $out,">../result/Ni_result_samples226/Ni_nr_arrange1_20180417.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split/\t/;
	$line[3] =~ s/Unclass.*/Unclassified/g;
	for my $i(0..3){
		print $out "$line[$i]\t";
	}
	print $out "$line[4]\n";
}
	

