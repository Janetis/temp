#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;



###################
open my $fh,"$out_dir/non_UU.txt" or die $!;
open my $out,">$out_dir/non_UU_arr20170721.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	print $out "$line[0]\t$line[9]\t$line[15]\t$line[16]\n";
}






