#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

open FILE,"../result/Se_result_samples226/blastp_nr_20170721_U.out" or die $!;
 open OUT,">../result/Se_result_samples226/blastp_nr_20170721_UU.txt" or die $!;
 open OUTII,">../result/Se_result_samples226/blastp_nr_20170721_UUother.txt" or die $!;
 open OUTIII,">../result/Se_result_samples226/blastp_nr_20170721_UUother1.txt" or die $!;

while(<FILE>){
	s/\v//g;
	my @hang = split("\t",$_);
	my @aa = split("",$hang[15]);
	my @aa1 = split("",$hang[16]);
	for my $i(0..$#aa){
		if ($aa[$i] eq 'U' and $aa1[$i] eq 'U'){
			print OUT "$_\n";
			next;
		}elsif($aa[$i] eq 'U' and $aa1[${i}-1] eq 'U'){
			print OUTII "$_\n";
			next;
		}elsif($aa[$i] eq 'U' and $aa1[${i}+1] eq 'U'){
			print OUTIII "$_\n";
			next;
		}
	}
	
}


