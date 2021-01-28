#!perl
use strict;
use warnings;


	################
open my $fh,"../result/Co_result_samples226/Co_0721_arr.txt" or die $!;

my %hash;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $new = $line[2]."_".$line[1]."_".$line[0];
	$hash{$new} = $line[21];
}
close $fh;
open my $fh1,"../result/Co_result_samples226/Co_nr_arrange_20180417.txt" or die $!;
open my $out,">../result/Co_result_samples226/Co_nr_arrange1_20180417.txt" or die $!;

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




