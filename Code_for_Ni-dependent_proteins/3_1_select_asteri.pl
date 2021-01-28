#!perl
use strict;
use warnings;


#########################step1#####
open my $fh,"../result/Ni_result_samples226/length50more_ppos20more_0721_all_result.txt" or die $!;
open my $out,">../result/Ni_result_samples226/ppos20more_0721_stop.txt" or die $!;
open my $out1,">../result/Ni_result_samples226/ppos20more_0721_other.txt" or die $!;

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

