#!perl
use strict;
use warnings;

my %hash;
open my $fh, "../result/Co_result_samples226/hitdata_0721_final.txt" or die $!;
open my $out,">../result/Co_result_samples226/Co226samples_0721_motif.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[1] eq 'RNRII' or $line[1] eq 'DDH' or $line[1] eq 'EAL'){
		print $out "$_\n";
		next;
	}
	if ($line[20] =~/E\wH\w\wG/ or $line[20] =~ /D\wH\w\wG/){
		$hash{$line[1]} = 1;
		###my $head = ">$line[2]"."_".$line[3]."_"."$line[1]";
		###print $out "$head\n$line[21]\n";
		print $out "$_\n";
	}
}

for my $key(keys %hash){
	print "$key\n";
}
