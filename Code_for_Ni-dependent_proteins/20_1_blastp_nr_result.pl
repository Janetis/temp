#!perl
use strict;
use warnings;
################step0####check###
open my $fh,"../result/Ni_result_samples226/Ni_blastp_nr_20170721_all_20180417.out" or die $!;
open my $out,">../result/Ni_result_samples226/Ni_blastp_nr_20180417_all_1.out" or die $!;

my %hash;
my $n = 0;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	for my $i(0..13){
		print $out "$line[$i]\t";
	}
	print $out "$line[14]\n";
	$hash{$line[0]} = 1;
}

for my $key(keys %hash){
	$n++;
}
print "$n\n";


