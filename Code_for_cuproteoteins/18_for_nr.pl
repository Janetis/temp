#!perl
use strict;
use warnings;
#
open my $fh,"../result/Cu_result_samples226/hitdata_0721_final.txt" or die $!;
open my $out,">../result/Cu_result_samples226/hitdata_0721_for_nr.fasta" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	print $out ">$line[2]"."_".$line[1]."_$line[0]\n"."$line[20]\n";
}
