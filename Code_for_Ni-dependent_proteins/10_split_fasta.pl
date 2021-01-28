#!perl
use strict;
use warnings;

open my $fh,"../result/Ni_result_samples226/other_less3_0721_E.fasta" or die $!;
mkdir "../result/Ni_result_samples226/for_rpsblast_query0721_Ni226";
my @file = <$fh>;
my $join = join("",@file);

my $n = 0;
my $m = 1;
my $out;
while($join =~ /(>\S+\n\S+)/mg){
	$n++;
	if($n == 3808){
		$m++;
		print $out "$1\n";
		$n = 0;
		next;
	}
	open $out,">>../result/Ni_result_samples226/for_rpsblast_query0721_Ni226/trans_0721_$m.txt" or die $!;
	print $out "$1\n";
}

