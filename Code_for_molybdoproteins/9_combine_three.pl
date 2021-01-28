#!perl;
use strict;
use warnings;



open my $fh,"../result/Mo_result_samples226/ppos20more_0721_minus40_other.txt" or die $!;
open my $out,">../result/Mo_result_samples226/other_less3_fdhA_0721.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $origin = $line[0];
	$line[0] =~ s/\d+_//g;
	$line[0] =~ s/_\d+//g;
	$hash{$line[0]} =1;
	for my $i(0..16,18..20){
		print $out "$line[$i]\t";
	}
	print $out "$origin\n";
}

open my $fh2,"../result/Mo_result_samples226/trans_0721less3.txt" or die $!;

while(<$fh2>){
	s/\v//g;
	my @line = split("\t",$_);
	my $origin = $line[0];
	$line[0] =~ s/\d+_//g;
	$line[0] =~ s/_\d+//g;
	$hash{$line[0]} =1;
	for my $i(0..16,20..22){
		print $out "$line[$i]\t";
	}
	print $out "$origin\n";
}

open my $fh3,"../result/Mo_result_samples226/fdhA_Mo226_trans0721filter_delz.txt" or die $!;

while(<$fh3>){
	s/\v//g;
	my @line = split("\t",$_);
	$hash{$line[0]} =1;
	for my $i(0..16,19..21){
		print $out "$line[$i]\t";
	}
	print $out "$line[22]\n";
}

for my $key(keys %hash){
	print "$key\n";
}



