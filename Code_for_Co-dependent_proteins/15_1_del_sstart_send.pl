#!perl
use strict;
use warnings;

#####
open FILE,"../result/Co_result_samples226/hitdata_0721_full_del_repeat.txt" or die $!;
open OUT,">../result/Co_result_samples226/test_chongfu.txt" or die $!;
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



