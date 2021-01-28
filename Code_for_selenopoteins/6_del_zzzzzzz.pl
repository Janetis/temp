#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

 open FILE,"../result/Se_result_samples226/pick_Se_20170721filter_delC.txt" or die $!;
 open OUT,">../result/Se_result_samples226/pick_Se_20170721filter_delz.txt" or die $!;
  while(<FILE>){
  	s/\v//g;
  	if ($_ =~ /zzzzzzz/){
  		next;
  	}else{
  		print OUT "$_\n";
  	}
  }

