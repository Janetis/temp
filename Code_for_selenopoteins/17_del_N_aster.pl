#!perl
use strict;
use warnings;


open my $fh,"../result/Se_result_samples226/blastp_nr_20170721UU_UC_seq.txt" or die $!;
open my $out,">../result/Se_result_samples226/blastp_nr_20170721UU_UC_delN.txt" or die $!;
open my $out1,">../result/Se_result_samples226/del_N.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[22] =~ /\*/){
		print $out1 "$_\n";
		next;

	}
	print $out "$_\n";
}
