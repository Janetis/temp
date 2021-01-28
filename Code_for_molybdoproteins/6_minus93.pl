#!perl
use strict;
use warnings;

open my $fh,"../result/Mo_result_samples226/fdhA_Mo226_trans0721filter_delz.txt" or die $!;
my %hash;
my $m = 0;
while(<$fh>){
	s/\v//g;
	$m++;
	my @line = split("\t",$_);
	my $key = $line[1].$line[2].$line[9].$line[16];
	print "$key\n";
	$hash{$key} = 1;
}

open my $fh2,"../result/Mo_result_samples226/length50more_ppos20more_0721_all_result.txt" or die $!;
open my $out2,">../result/Mo_result_samples226/ppos20more_0721_minus40.txt" or die $!;
my $n = 0;
while(<$fh2>){
	s/\v//g;
	$n++;
	my @line = split("\t",$_);
	my $key = $line[1].$line[2].$line[9].$line[16];
	if (defined $hash{$key}){
		next;
	}else{
		print $out2 "$_\n";
	}
}

