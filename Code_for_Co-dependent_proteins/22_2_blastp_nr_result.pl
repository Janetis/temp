#!perl
use strict;
use warnings;
###############step1######
open my $fh,"../result/Co_result_samples226/Co_blastp_nr_20170721_all_1.out" or die $!;

my @lines = map{s/\v//g;$_}<$fh>;
my @headers = split("\t",shift @lines);
@lines = map{my %temp;@temp{@headers} = split /\t/;\%temp} @lines;
@lines = sort{$a->{'qseqid'} cmp $b->{'qseqid'} or
			  $a->{'evalue'} <=> $b->{'evalue'} or
			  $b->{'ppos'} <=> $a->{'ppos'}
			  } @lines;
open my $out,">../result/Co_result_samples226/Co_nr_first.txt" or die $!;
my $header = join("\t",@headers);
print $out "$header\n";
my $pre = '';
for my $l(@lines){
	my $now = @$l{qseqid};
	if($now ne $pre){
		$pre = $now; 
		print $out join("\t",@$l{@headers})."\n";
	}
}

