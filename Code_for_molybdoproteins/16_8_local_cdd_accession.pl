#!perl
use strict;
use warnings;


##################sort######step7
open my $fh,"../result/Mo_result_samples226/hitdata_0913_delCd_sec_min.txt" or die $!;
open my $out,">../result/Mo_result_samples226/hitdata_0913_delCd_sec_min_sort.txt" or die $!;

my @lines = map{s/\v//g;$_}<$fh>;
my @headers = split("\t",shift @lines);
@lines = map{my %temp;@temp{@headers} = split /\t/;\%temp}@lines;
@lines = sort{$a->{'Mo_protein'} cmp $b->{'Mo_protein'} or 
					$a->{'evalue'} <=> $b->{'evalue'}}@lines;

for my $l(@lines){
	print $out join("\t",@$l{@headers})."\n";
}
#

