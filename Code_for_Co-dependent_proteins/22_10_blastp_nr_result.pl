#!perl
use strict;
use warnings;

open my $fh,"../result/Co_result_samples226/Co_nr_arrange.txt" or die $!;
open my $out,">../result/Co_result_samples226/RNRII_virus.txt" or die $!;

while(<$fh>){
	s/\v//g;
	if($_ =~ /RNRII.*Virus/){
		print $out "$_\n";
	}
}

