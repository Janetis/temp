#!perl
use strict;
use warnings;



open my $fh,"../result/Mo_result_samples226/chongfu_full_longer.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key;
	for my $i(1..16){
		$key .= $line[$i]."\t";
	}
	$key .= $line[17];
	$hash{$key} = $line[18];
}

open my $fh1,"../result/Mo_result_samples226/hitdata_0913_match_all_full.txt" or die $!;
open my $out,">../result/Mo_result_samples226/hitdata_0913_match_all_full_del.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key;
	for my $i(1..16){
		$key .= $line[$i]."\t";
	}
	$key .= $line[17];
	if(exists $hash{$key}){
		next;
	}
	print $out "$_\n";
}



