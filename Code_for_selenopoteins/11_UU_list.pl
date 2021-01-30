#!perl
use strict;
use warnings;

open my $fh,"$out_dir/blastp_nr_20170721_UU.txt" or die $!;
open my $out,">$out_dir/blastp_nr_20170721UU_list.txt" or die $!;
my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	$hash{$line[0]} = 1;
}

for my $key(sort{$a cmp $b}keys %hash){
	print $out "$key\n";
}
