#!perl
use strict;
use warnings;




#########step3#######
open my $fh,"../result/Ni_result_samples226/chongfu_full.txt" or die $!;

my %hash;

while(<$fh>){
	s/\v//g;
	$hash{$_} = 1;
}

open my $fh1,"../result/Ni_result_samples226/hitdata_0913_match_all_full.txt" or die $!;
open my $out,">../result/Ni_result_samples226/hitdata_0913_full_del_repeat.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	if(exists $hash{$_}){
		next;
	}
	print $out "$_\n";
}
#

