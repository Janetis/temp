#!perl
use strict;
use warnings;


	#########################33
open my $fh,"$out_dir/chongfu_full_longer.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key;
	for my $i(1..16){
		$key .= $line[$i]."\t";
	}
	$key .= $line[17];
	$hash{$key} = $line[18];
}

open my $fh1,"$out_dir/hitdata_0721_match_full.txt" or die $!;
open my $out,">$out_dir/hitdata_0721_match_full_del.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key;
	for my $i(1..16){
		$key .= $line[$i]."\t";
	}
	$key .= $line[17];
	my $len = length($line[20]);
	if(exists $hash{$key}){
		next;
	}
	print $out "$_\n";
}



