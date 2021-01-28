#!perl
use strict;
use warnings;


#
##########step2 delete the cd CHL MTH sd PTZ PHA items####
open my $fh,"../result/Ni_result_samples226/hitdata_0721_arr.txt" or die $!;
open my $out,">../result/Ni_result_samples226/hitdata_0721_delCd.txt" or die $!;
open my $out1,">../result/Ni_result_samples226/temp.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[1] =~ /cd|CHL|MTH|sd|PTZ|PHA|PLN|smart/){
		print $out1 "$_\n";
		next;
	}
	print $out "$_\n";
}

