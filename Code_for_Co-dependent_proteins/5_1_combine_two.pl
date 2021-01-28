#!perl;
use strict;
use warnings;

open my $fh,"../result/Co_result_samples226/ppos20more_0721_other.txt" or die $!;
open my $out,">../result/Co_result_samples226/other_less3_0721.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $origin = $line[0];
	$line[0] =~ s/_\d+//g;
	for my $i(0..16,19..21){
		print $out "$line[$i]\t";
	}
	print $out "$origin\n";
}

open my $fh1,"../result/Co_result_samples226/trans_0721less3.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $origin = $line[0];
	$line[0] =~ s/_\d+//g;
	for my $i(0..16,20..22){
		print $out "$line[$i]\t";
	}
	print $out "$origin\n";
}


