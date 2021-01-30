#!perl
use strict;
use warnings;

 open my $fh,"$out_dir/blastp_nr_20170721_readCounts_arr.txt" or die $!;
 open my $out,">$out_dir/Se226_20170721_arr_xu1.txt" or die $!;
 my $n=0;
 while(<$fh>){
 	$n++;
	s/\v//g;
	my @line = split("\t",$_);
 	if ($line[2] =~ /\S+?\,(GS\w+)/){
 		print $out "$1\t$_\n";
 	}
 }
 print "$n\n";

