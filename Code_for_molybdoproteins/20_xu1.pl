#!perl
use strict;
use warnings;

#################################################################
################################################
###############Í³¼Æãfµ°°×#######################
###############################################
 open my $fh,"../result/Mo_result_samples226/hitdata_0913_arr.txt" or die $!;
 open my $out,">../result/Mo_result_samples226/hitdata_0913_arr_xu1.txt" or die $!;
 while(<$fh>){
 	s/\v//g;
	my @line = split("\t",$_);
 	if ($line[2] =~ /\S+\,(\S+)/){
 	print $out "$1\t$_\n";
 	}
 }

