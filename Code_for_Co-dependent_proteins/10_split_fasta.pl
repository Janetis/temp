#!perl
use strict;
use warnings;

open my $fh,"$out_dir/other_less3_0721_E.fasta" or die $!;
mkdir "$out_dir/for_rpsblast_query0721_Co226";
my @file = <$fh>;
my $join = join("",@file);

my $n = 0;
my $m = 1;
my $out;
while($join =~ /(>\S+\n\S+)/mg){
	$n++;
	if($n == 11350){
		$m++;
		print $out "$1\n";
		$n = 0;
		next;
	}
	open $out,">>$out_dir/for_rpsblast_query0721_Co226/trans_0721_$m.txt" or die $!;
	print $out "$1\n";
}

