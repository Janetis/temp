#!perl
use strict;
use warnings;

##步骤一：挑选出query,read id和frame一致的重复项#####
open FILE,"$out_dir/hitdata_0721_full_del.txt" or die $!;
open OUT,">$out_dir/test_chongfu.txt" or die $!;
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
