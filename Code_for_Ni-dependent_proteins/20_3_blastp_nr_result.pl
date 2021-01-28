#!perl
use strict;
use warnings;

###############step2############extract gi number###
open my $fh,"../result/Ni_result_samples226/Ni_nr_first_20180417.txt" or die $!;
open my $fh2,"gi_taxid_prot.dmp" or die $!;
open my $out,">../result/Ni_result_samples226/Ni_nr_first_taxid2_20180417.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split/\t/;
	if($line[1] =~ /gi\|(\d+)/){
		$hash{$1} = 1;
	}
}

while(<$fh2>){
	s/\v//g;
	my @line = split/\t/;
	if(exists $hash{$line[0]}){
		print $out "$line[0]\t$line[1]\n";
	}
}


