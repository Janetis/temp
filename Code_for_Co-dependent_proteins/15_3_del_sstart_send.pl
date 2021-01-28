#!perl
use strict;
use warnings;

#########################################

open my $fh,"../result/Co_result_samples226/test_chongfu_full.txt" or die $!;
open my $out,">../result/Co_result_samples226/test_chongfu_full_sort.txt" or die $!;

my @lines = map{s/\v//g;$_}<$fh>;
my @headers = split("\t",shift @lines);
@lines = map{my %temp;@temp{@headers} = split /\t/;\%temp}@lines;
@lines = sort{$a->{'sseqid'} cmp $b->{'sseqid'} or 
			  $a->{'sframe'} <=> $b->{'sframe'} or
			  $a->{'evalue'} <=> $b->{'evalue'}}@lines;
for my $l(@lines){
	print $out join("\t",@$l{@headers})."\n";
}


