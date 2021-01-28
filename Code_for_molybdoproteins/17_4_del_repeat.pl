#!perl
use strict;
use warnings;
#
#########step4#############
open my $fh,"../result/Mo_result_samples226/chongfu_full.txt" or die $!;

my @lines = map{s/\v//g;$_} <$fh>;
my @headers = split("\t", shift @lines);
@lines = map{my %temp; @temp{@headers} = split /\t/; \%temp } @lines;
@lines = sort{$a->{'sseqid'} cmp $b->{'sseqid'} or
				$a->{'qstart'} <=> $b->{'qstart'}} @lines;
open my $out,">../result/Mo_result_samples226/chongfu_full_sort.txt" or die $!;
my $head =join("\t",@headers);
print $out "$head\n";
	for my $l (@lines) {
 		print $out join("\t", @$l{@headers}) . "\n";
	}

