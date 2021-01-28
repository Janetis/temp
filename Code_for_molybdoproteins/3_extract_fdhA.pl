#!perl
use strict;
use warnings;

open my $fh,"../result/Mo_result_samples226/length50more_ppos20more_0721_all_result.txt" or die $!;
open my $out,">../result/Mo_result_samples226/fdhA_Mo226_0721.txt" or die $!;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[0] =~ /DMSOR|fdhA/ && $line[16] =~ /\*/){
		for my $i(0..15){
			print $out "$line[$i]\t";
		}
		print $out "$line[16]\n";
	}
}
