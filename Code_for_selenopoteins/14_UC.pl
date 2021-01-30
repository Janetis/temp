#!perl
use strict;
use warnings;

open my $fh,"$out_dir/blastp_nr_non_UU_order20170721.txt" or die $!;
open my $out,">$out_dir/blastp_nr_non_UU20170721_order20.txt" or die $!;
my $n = 0;
my $pre = '';
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my @query_l = split("",$line[2]);
	my @subject_l = split("",$line[3]);
	if($line[0] ne $pre){
		$n = 0;
	}
	$n++;
	if($n <= 20){
		for my $i(0..$#query_l){
			if($query_l[$i] eq 'U' && $subject_l[$i] eq 'C'){
				print $out "$_\n";
				next;
			}
		}
	$pre = $line[0];
	}
}




