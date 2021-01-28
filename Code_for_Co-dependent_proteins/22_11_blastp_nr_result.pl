#!perl
use strict;
use warnings;

	
open my $fh,"../result/Co_result_samples226/RNRII_virus.txt" or die $!;


my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split/\t/;
	my $new = $line[0]."_".$line[1]."_".$line[2];
	$hash{$new} = 1;
}

open my $fh1,"../result/Co_result_samples226/Co_nr_first.txt" or die $!;
open my $out,">../result/Co_result_samples226/RNRII_virus.fasta" or die $!;

my %hash1;
while(<$fh1>){
	s/\v//g;
	next if $. == 1;
	my @line = split/\t/;
	my $new;
	if($line[0] =~ /,(\S+)_\d+/){
		$new = $1."_".$line[1];
		print "$new\n";
	}
	if(exists $hash{$new}){
		$hash1{$line[0]} = 1;
	}
}

open my $fh2,"../result/Co_result_samples226/hitdata_0721_for_nr.fasta" or die $!;

my %hash3;
my $key;
while(<$fh2>){
	s/\v//g;
	if($_ =~ />(\S+)/){
		$key = $1;
	}else{
		$hash3{$key} = $_;
		if(exists $hash1{$key}){
			print $out ">$key\n$hash3{$key}\n";
		}
	}
}
