#!perl
use strict;
use warnings;


##########################step1#####
open my $fh,"$out_dir/length50more_ppos20more_0721_all_result.txt" or die $!;
open my $out,">$out_dir/ppos20more_0721_stop.txt" or die $!;
open my $out1,">$out_dir/ppos20more_0721_other.txt" or die $!;

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

