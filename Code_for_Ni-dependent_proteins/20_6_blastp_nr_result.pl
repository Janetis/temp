#!perl
use strict;
use warnings;


##########step5#########
open my $fh,"../result/Ni_result_samples226/taxid_class_20180417.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split/\t/;
	$hash{$line[0]} = $line[1]."\t".$line[2];
}

open my $fh1,"../result/Ni_result_samples226/Ni_nr_first_taxid2_20180417.txt" or die $!;

my %hash_gi;
while(<$fh1>){
	s/\v//g;
	my @line = split/\t/;
	if(exists $hash{$line[1]}){
		$hash_gi{$line[0]} = $hash{$line[1]};
	}
}

open my $fh2,"../result/Ni_result_samples226/Ni_nr_first_20180417.txt" or die $!;
open my $out,">../result/Ni_result_samples226/Ni_nr_taxon_20180417.txt" or die $!;

while(<$fh2>){
	s/\v//g;
	next if $. == 1;
	my @line = split/\t/;
	print $out "$line[0]\t$line[1]\t";
	if($line[1] =~ /gi\|(\d+)/){
		if(exists $hash_gi{$1}){
			print $out "$hash_gi{$1}\n";
		}else{
			print $out "Unclassified\tUnclassified\n";
		}
	}
}
	

	
