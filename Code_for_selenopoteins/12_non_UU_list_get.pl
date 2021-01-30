#!perl
use strict;
use warnings;


open my $fh,"$out_dir/blastp_nr_20170721UU_list.txt" or die $!;
my %hash;
while(<$fh>){
	s/\v//g;
	$hash{$_} = 1;
}

open my $fh1,"$out_dir/blastp_nr_20170721_U.out" or die $!;
open my $out,">$out_dir/non_UU.txt" or die $!;
while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
		if (exists $hash{$line[0]}){
			next;
		}else{
			print $out "$_\n";
		}
}

