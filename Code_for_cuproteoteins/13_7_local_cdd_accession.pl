#!perl
use strict;
use warnings;



###################sort######step7
open my $fh,"../result/Cu_result_samples226/hitdata_0721_delCd_sec_min.txt" or die $!;
open my $out,">../result/Cu_result_samples226/hitdata_0721_delCd_sec_min_sort.txt" or die $!;

my @lines = map{s/\v//g;$_}<$fh>;
my @headers = split("\t",shift @lines);
@lines = map{my %temp;@temp{@headers} = split /\t/;\%temp}@lines;
@lines = sort{$a->{'Cu_protein'} cmp $b->{'Cu_protein'} or 
					$a->{'evalue'} <=> $b->{'evalue'}}@lines;

for my $l(@lines){
	print $out join("\t",@$l{@headers})."\n";
}

