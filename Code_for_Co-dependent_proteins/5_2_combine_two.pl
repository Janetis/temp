#!perl;
use strict;
use warnings;


###################
open my $out,">>../result/Co_result/trans_1207other_all_result.txt" or die $!;

open my $fh,"../result/Co_result/trans_1207less3.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	for my $i(0..16,19..20){
		print $out "$line[$i]\t";
	}
	print $out "$line[21]\n";
}


