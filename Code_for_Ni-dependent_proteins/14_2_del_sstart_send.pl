#!perl
use strict;
use warnings;




###步骤二：根据步骤一把文档中的所有重复项挑选出来######
open FILE,"../result/Ni_result_samples226/test_chongfu.txt" or die $!;
open OUT,">../result/Ni_result_samples226/test_chongfu_full.txt" or die $!;
open OUTII,">../result/Ni_result_samples226/not_chongfu.txt" or die $!;
my %hash;
while(<FILE>){
	s/\v//g;
	$hash{$_} = 2;
}
close FILE;
open FILEII,"../result/Ni_result_samples226/hitdata_0913_full_del_repeat.txt" or die $!;
while(<FILEII>){
	s/\v//g;
	my @hang = split("\t",$_);
	my $key = $hang[2]."\t".$hang[9];
	if(exists $hash{$key}){
		print OUT "$_\n";
	}else{
		print OUTII "$_\n";
	}
}

