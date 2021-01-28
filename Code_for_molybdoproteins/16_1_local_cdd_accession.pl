#!perl
use strict;
use warnings;


######step1#######
open my $fh,"cddid.tbl" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	$hash{$line[0]} = $line[1];
}
open my $fh1,"../result/Mo_result_samples226/hitdata_0721_all.out" or die $!;
open my $out,">../result/Mo_result_samples226/hitdata_0721_arr.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	if($_ =~ /^#/){
		next;
	}
	my @line = split("\t",$_);
	if($line[1] =~ /(\d+)$/){
		if(exists $hash{$1}){
			$line[1] = $hash{$1};
		}
	}
	for my $i(0..$#line){
		print $out "$line[$i]\t";
	}
	print $out "\n";
}
#
