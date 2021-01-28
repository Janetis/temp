#!perl
use strict;
use warnings;

open my $fh,"../result/Se_result_samples226/blastp_nr_20170721.out" or die $!;
open my $out,">../result/Se_result_samples226/blastp_nr_20170721_U.out" or die $!;
open my $out1,">../result/Se_result_samples226/blastp_nr_20170721_U_else.out" or die $!;

my $m = 0;
my $n = 0;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	$m++;
	print "$m\n";
	if($line[15] =~ /U/i){
		print $out "$_\n";
		$n++;
		next;
	}
	print $out1 "$_\n";
}
print $out1 "$m\t$n\n";

