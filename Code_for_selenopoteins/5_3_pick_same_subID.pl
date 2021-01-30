#!perl
use strict;
use warnings;

#step3######################################
open my $fh,"$out_dir/filter_del_chongfu.txt" or die $!;
my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key = $line[0].$line[1].$line[8].$line[20];
	$hash{$key} = $_;
}

open my $fh1,"$out_dir/pick_Se_20170721filter_del.txt" or die $!;
open my $out,">$out_dir/pick_Se_20170721filter_delC.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key = $line[0].$line[1].$line[8].$line[20];
	if(exists $hash{$key}){
		print $out "$hash{$key}\n";
	}else{
		print $out "$_\n";
	}
}
	
