#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

open my $fh,"$out_dir/pick_Se_20170721.txt" or die $!;
open my $out,">$out_dir/pick_Se_20170721_arr.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	for my $i(0..17){
		print $out "$line[$i]\t";
	}
	print $out "$line[19]\t$line[20]\t$line[21]\t$line[22]\n";
}

