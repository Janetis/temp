#!perl
use strict;
use warnings;

 open my $fh,"$out_dir/hitdata_0913_arr.txt" or die $!;
 open my $out,">$out_dir/hitdata_0913_arr_xu1.txt" or die $!;
 while(<$fh>){
 	s/\v//g;
	my @line = split("\t",$_);
 	if ($line[2] =~ /\S+\,(\S+)/){
 	print $out "$1\t$_\n";
 	}
 }

