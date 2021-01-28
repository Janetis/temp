#!perl
use strict;
use warnings;

open my $fh,"../result/Mo_result_samples226/other_less3_fdhA_0721.fasta" or die $!;
mkdir "../result/Mo_result_samples226/for_rpsblast_query0721_Mo226";
my @file = <$fh>;
my $join = join("",@file);

my $n = 0;
my $m = 1;
my $out;
while($join =~ /(>\S+\n\S+)/mg){
	$n++;
	if($n == 12658){
		$m++;
		print $out "$1\n";
		$n = 0;
		next;
	}
	open $out,">>../result/Mo_result_samples226/for_rpsblast_query0721_Mo226/trans_0721_$m.txt" or die $!;
	print $out "$1\n";
}

