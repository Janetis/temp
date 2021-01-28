#!perl
use strict;
use warnings;

#############for rpsblast#####
open my $fh,"../result/Cu_result_samples226/for_ligands_0721.fasta" or die $!;
mkdir "../result/Cu_result_samples226/for_rpsblast_query0721_Cu226";
my @file = <$fh>;
my $join = join("",@file);

my $n = 0;
my $m = 1;
my $out;
while($join =~ /(>\S+\n\S+)/mg){
	$n++;
	if($n == 463){
		$m++;
		print $out "$1\n";
		$n = 0;
		next;
	}
	open $out,">>../result/Cu_result_samples226/for_rpsblast_query0721_Cu226/trans_0721_$m.txt" or die $!;
	print $out "$1\n";
}

