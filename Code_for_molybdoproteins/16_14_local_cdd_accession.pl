#!perl
use strict;
use warnings;


##################检查那些alignment part 中有stop codon的结果是否出现两条或以上的结果通过cdd的验证，如果有的话要留下一个翻译结果最长的那条##因为很少，所以先备份，然后手动删除####
open my $fh,"../result/Mo_result_samples226/hitdata_0913_match_all_full.txt" or die $!;
open my $out,">../result/Mo_result_samples226/chongfu_temp.txt" or die $!;
my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key;
	for my $i(1..16){
		$key .= $line[$i]."\t";
	}
		$key .= $line[17];
	if(exists $hash{$key}){
		print $out "$_\n";
	}else{
		$hash{$key} = 1;
	}
}

