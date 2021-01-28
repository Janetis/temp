#!perl
use strict;
use warnings;


#########################step1#####
open my $fh,"../result/Mo_result_samples226/ppos20more_0721_minus40.txt" or die $!;
open my $out,">../result/Mo_result_samples226/ppos20more_0721_minus40_stop.txt" or die $!;
open my $out1,">../result/Mo_result_samples226/ppos20more_0721_minus40_other.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[16] =~ /\*/){
		for my $i(0..15){
			print $out "$line[$i]\t";
		}
		print $out "$line[16]\n";
		next;
	}
	print $out1 "$_\n";
}


