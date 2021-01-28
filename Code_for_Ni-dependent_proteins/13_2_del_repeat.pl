#!perl
use strict;
use warnings;



#########step2#########
open my $fh,"../result/Ni_result_samples226/chongfu.txt" or die $!;

my %hash;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[9] > 0){
	$line[9] = "pos";
	}elsif($line[9] < 0){
		$line[9] = "neg";
	}

	my $key = $line[21]."\t".$line[2]."\t".$line[9];
	$hash{$key} = 1;
}

open my $fh1,"../result/Ni_result_samples226/hitdata_0913_match_all_full.txt" or die $!;
open my $out,">../result/Ni_result_samples226/chongfu_full.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[9] > 0){
	$line[9] = "pos";
	}elsif($line[9] < 0){
		$line[9] = "neg";
	}

	my $key = $line[21]."\t".$line[2]."\t".$line[9];

	if(exists $hash{$key}){
		print $out "$_\n";
	}
}



