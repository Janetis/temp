#!perl
use strict;
use warnings;

open my $fh,"../result/Mo_result_samples226/hitdata_0913_final.txt" or die $!;
open my $out,">../result/Mo_result_samples226/hitdata_0913_final_cbind.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[1] eq "AOR"){
		next;
	}
	if($line[1] eq "new"){
		$line[1] = "SO";
	}
	for my $i(0..$#line-1){
		print $out "$line[$i]\t";
	}
	print $out "$line[$#line]\n";
}
