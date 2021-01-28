#!perl;
use strict;
use warnings;


#

##################################################
open my $out,">>../result/Ni_result/trans_1206other_server.txt" or die $!;

open my $fh,"../result/Ni_result/trans_1206less3.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	for my $i(0..16,19..20){
		print $out "$line[$i]\t";
	}
	print $out "$line[21]\n";
}
#
#
