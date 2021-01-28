#!perl
use strict;
use warnings;


##################取每个蛋白中evalue最小的那一个#######step8
open my $fh,"../result/Mo_result_samples226/hitdata_0913_delCd_sec_min_sort.txt" or die $!;
open my $out,">../result/Mo_result_samples226/hitdata_0913_delCd_sec_min_sort_min.txt" or die $!;

my $flag = '';
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[0] ne $flag){
		print $out "$_\n";
		$flag = $line[0];
	}
}



