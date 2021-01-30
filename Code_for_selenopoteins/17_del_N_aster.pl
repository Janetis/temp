#!perl
use strict;
use warnings;


open my $fh,"$out_dir/blastp_nr_20170721UU_UC_seq.txt" or die $!;
open my $out,">$out_dir/blastp_nr_20170721UU_UC_delN.txt" or die $!;
open my $out1,">$out_dir/del_N.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[22] =~ /\*/){
		print $out1 "$_\n";
		next;

	}
	print $out "$_\n";
}
