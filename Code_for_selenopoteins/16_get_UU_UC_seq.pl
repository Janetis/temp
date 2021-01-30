#!perl
use strict;
use warnings;

open my $fh,"$out_dir/blastp_nr_20170721UU_UC_list.txt" or die $!;
open my $out,">$out_dir/blastp_nr_20170721UU_UC_seq.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	$hash{$_} = 1;
}
close $fh;
open my $fh1,"$out_dir/pick_Se_20170721filter_delz_num.txt" or die $!;
while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $new = $line[1]."_".$line[0];
	if(exists $hash{$new}){
		print $out "$_\n";
	}
}

