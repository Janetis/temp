#!perl;
use strict;
use warnings;

open my $fh,"$out_dir/ppos20more_0721_other.txt" or die $!;
open my $out,">$out_dir/other_less3_0721.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $origin = $line[0];
	$line[0] =~ s/_\d+//g;
	$line[0] =~ s/\d+_//g;
	$line[0] =~ s/_family//g;
	for my $i(0..16,17,18..20){
		print $out "$line[$i]\t";
	}
	print $out "$origin\n";
}

open my $fh1,"$out_dir/trans_0721less3.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $origin = $line[0];
	$line[0] =~ s/_\d+//g;
	$line[0] =~ s/\d+_//g;
	$line[0] =~ s/_family//g;
	for my $i(0..16,17,20..22){
		print $out "$line[$i]\t";
	}
	print $out "$origin\n";
}


