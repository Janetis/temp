#!perl
use strict;
use warnings;

##步骤一：挑选出query,read id和frame一致的重复项#####
open FILE,"../result/Cu_result_samples226/hitdata_0721_full_del.txt" or die $!;
open OUT,">../result/Cu_result_samples226/test_chongfu.txt" or die $!;
my %hash;
while(<FILE>){
	chomp;
	my @hang = split("\t",$_);
	my $key = $hang[2]."\t".$hang[9];
	if(exists $hash{$key}){
		print OUT "$key\n";
	}else{
		$hash{$key} = 2;
	}
}
