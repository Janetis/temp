#!perl
use strict;
use warnings;


	

	#########step6#######
open my $fh,"../result/Ni_result_samples226/hitdata_0913_arr.txt" or die $!;

my %hash;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $new = $line[2]."_".$line[1]."_".$line[0];
	$hash{$new} = $line[21];
}
close $fh;
open my $fh1,"../result/Ni_result_samples226/Ni_nr_taxon_20180417.txt" or die $!;
open my $out,">../result/Ni_result_samples226/Ni_nr_arrange_20180417.txt" or die $!;

my $n = 0;
while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash{$line[0]}){
		$n++;
		print $out "$_\t$hash{$line[0]}\n";
	}else{
		print "$line[0]\n";
	}
}

print "$n\n";





