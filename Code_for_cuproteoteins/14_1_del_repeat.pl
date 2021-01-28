#!perl
use strict;
use warnings;


######step1########
open my $fh,"../result/Cu_result_samples226/hitdata_0721_full_del.txt" or die $!;
open my $out,">../result/Cu_result_samples226/chongfu.txt" or die $!;

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
	if(exists $hash{$key}){
		print $out "$_\n";
	}else{
		$hash{$key} = 1;
	}
}
##

