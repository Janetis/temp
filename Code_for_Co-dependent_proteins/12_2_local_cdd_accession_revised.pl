#!perl
use strict;
use warnings;


	#
#########step2 delete the CHL MTH sd PTZ PHA items####
open my $fh,"../result/Co_result_samples226/hitdata_0721_arr.txt" or die $!;
open my $out,">../result/Co_result_samples226/hitdata_0721_delCd.txt" or die $!;
open my $out1,">../result/Co_result_samples226/temp.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[1] =~ /CHL|MTH|sd|PTZ|PHA|smart/){
		print $out1 "$_\n";
		next;
	}
	if($line[0] =~ /^CprA/ && $line[1] eq 'cd06185'){
		print $out1 "$_\n";
		next;
	}
#
		print $out "$_\n";
}

