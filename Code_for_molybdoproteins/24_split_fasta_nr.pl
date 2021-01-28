#!perl
use strict;
use warnings;

############for nr#####
open my $fh,"../result/Mo_result_samples226/Mo_rest_rest2.fasta" or die $!;
mkdir "../result/Mo_result_samples226/for_nr_blastp_query0721_Mo226_rest_rest2";
my @file = <$fh>;
my $join = join("",@file);

my $n = 0;
my $m = 1;
my $out;
while($join =~ /(>\S+\n\S+)/mg){
	$n++;
	if($n == 349){
		$m++;
		print $out "$1\n";
		$n = 0;
		next;
	}
	open $out,">>../result/Mo_result_samples226/for_nr_blastp_query0721_Mo226_rest_rest2/trans_0721_$m.txt" or die $!;
	print $out "$1\n";
}

