#!perl
use strict;
use warnings;

######step1#################################################################
open my $fh,"../result/Se_result_samples226/pick_Se_20170721filter_del.txt" or die $!;
open my $out,">../result/Se_result_samples226/filter_del_temp.txt" or die $!;
my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key = $line[1]."\t".$line[8];
	if(exists $hash{$key}){
			print $out "$key\n";
	}else{
		$hash{$key} = 1;
	}
}


	

