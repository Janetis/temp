#!perl
use strict;
use warnings;

open my $fh,"$out_dir/pick_Se_20170721filter_delz.txt" or die $!;
open my $out,">$out_dir/pick_Se_20170721filter_delz.fasta" or die $!;
open my $out1,">$out_dir/pick_Se_20170721filter_delz_num.txt" or die $!;

my $n = 0;
my $m = 0;
while(<$fh>){
	s/\v//g;
	$n++;
	if($n == 1){
		next;
	}
	$m = $n-1;
	my @line = split("\t",$_);
	my $head = ">".$line[0]."_".$m;
	print $out "$head\n$line[21]\n";
	print $out1 "$m\t$_\n";
}

	
