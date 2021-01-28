#!perl
use strict;
use warnings;

#步骤一：挑选出query,read id和frame一致的重复项#####
open FILE,"../result/Ni_result_samples226/hitdata_0913_full_del_repeat.txt" or die $!;
open OUT,">../result/Ni_result_samples226/test_chongfu.txt" or die $!;
my %hash;
while(<FILE>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key = $line[2]."\t".$line[9];
		print "$key\n";
	if(exists $hash{$key}){
		print OUT "$key\n";
	}else{
		$hash{$key} = 1;
	}
}



