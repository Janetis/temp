#!perl
use strict;
use warnings;


################UC_if_one.pl###################
open my $fh,"../result/Se_result_samples226/blastp_nr_non_UU20170721_order20.txt" or die $!;

open my $out,">../result/Se_result_samples226/blastp_nr_20170721UC_list.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	$hash{$line[0]} = 1;
}

for my $key(keys %hash){
	print $out "$key\n";
}
