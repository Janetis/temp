#!perl
use strict;
use warnings;

###########for nr#####
open my $fh,"../result/Co_result_samples226/hitdata_0721_for_nr.fasta" or die $!;
mkdir "../result/Co_result_samples226/for_nr_blastp_query0721_Co226";
my @file = <$fh>;
my $join = join("",@file);

my $n = 0;
my $m = 1;
my $out;
while($join =~ /(>\S+\n\S+)/mg){
	$n++;
	if($n == 1125){
		$m++;
		print $out "$1\n";
		$n = 0;
		next;
	}
	open $out,">>../result/Co_result_samples226/for_nr_blastp_query0721_Co226/trans_0721_$m.txt" or die $!;
	print $out "$1\n";
}

