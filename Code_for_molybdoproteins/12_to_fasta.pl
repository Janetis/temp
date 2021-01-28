#!perl
use strict;
use warnings;

open my $fh,"../result/Mo_result_samples226/other_less3_fdhA_0721_longer_E.txt" or die $!;
open my $out,">../result/Mo_result_samples226/other_less3_fdhA_0721_num.txt" or die $!;
open my $out1,">../result/Mo_result_samples226/other_less3_fdhA_0721.fasta" or die $!;

my $n = 0;
my $m = 0;
while(<$fh>){
	s/\v//g;
	next if $. == 1;
	$n++;
	my @line = split("\t",$_);
	$m = $n-1;
	print $out "$n\t$_\n";
	my $head = ">".$line[0]."_".$n;
	print $out1 "$head\n$line[19]\n";
}
print "$n\n";

