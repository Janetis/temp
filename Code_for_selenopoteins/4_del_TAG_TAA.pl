#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

  open FILE,"$out_dir/pick_Se_20170721filter.txt" or die $!;
  open OUT,">$out_dir/pick_Se_20170721filter_del.txt" or die $!;
  open my $out,">$out_dir/temp.txt" or die $!;
  my $n = 0;
  while(<FILE>){
  	s/\v//g;
  	$n++;
  	if ($n == 1){
  		print OUT "$_\n";
  	}
  	my @hang = split("\t",$_);
  	if ($hang[18] =~ /TAG/ or $hang[18] =~ /TAA/){
		print $out "$_\n";
  		next;
  	}else{
  		print OUT "$_\n";
  	}
  }
