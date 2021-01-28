#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

 ###########################
 #mannully check####
 #del_zzz.pl####del_TAG_TAA.pl####
 #########################################
 
open my $fh,"../result/Mo_result_samples226/fdhA_Mo226_trans0721filter.txt" or die $!;
  open my $out,">../result/Mo_result_samples226/fdhA_Mo226_trans0721filter_del.txt" or die $!;
  open my $out1,">../result/Mo_result_samples226/temp.txt" or die $!;
  my $n = 0;
  while(<$fh>){
  	s/\v//g;
  	$n++;
  	if ($n == 1){
  		print $out "$_\n";
		next;
  	}
  	my @line = split("\t",$_);
  	if ($line[18] =~ /TAG/ or $line[18] =~ /TAA/){
		print $out1 "$_\n";
  		next;
  	}else{
  		print $out "$_\n";
  	}
  }

