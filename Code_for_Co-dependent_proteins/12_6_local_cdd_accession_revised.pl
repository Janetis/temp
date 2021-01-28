#!perl
use strict;
use warnings;



########
#####################去除evalue 有两个零的蛋白###step6
open my $fh,"../result/Co_result_samples226/hitdata_0721_delCd_min.txt" or die $!;

my %hash;
my %hash_two;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash{$line[0]}{$line[2]} && $line[2] == 0){
		$hash_two{$line[0]} = 1;
	}

	if($line[2] == 0){
		$hash{$line[0]}{$line[2]} = 1;
	}
}

open my $fh1,"../result/Co_result_samples226/hitdata_0721_delCd_min.txt" or die $!;
open my $out,">../result/Co_result_samples226/hitdata_0721_delCd_sec_min.txt" or die $!;

print $out "Co_protein\taccession\tevalue\n";
while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash_two{$line[0]}){
		next;
	}
	print $out "$_\n";
}

#

