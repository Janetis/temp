#!perl
use strict;
use warnings;

#########for bac#####
open my $fh,"../result/Cu_result_samples226/other_less3_0721.txt" or die $!;
open my $out,">../result/Cu_result_samples226/other_less3_0721_delz.txt" or die $!;
open my $out1,">../result/Cu_result_samples226/zzz.txt" or die $!;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $new;
	if($line[20] =~ /zzzzzzz/){
		print $out1 "$_\n";
	}else{
		for my $i(0..20){
			$new .= $line[$i]."\t";
		}
		$new .= $line[21];
		print $out "$new\n";
	}
}

















