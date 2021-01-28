#!perl
use strict;
use warnings;

###############step1######
open my $fh,"../result/Ni_result_samples226/Ni_blastp_nr_20180417_all_1.out" or die $!;

my @lines = map{s/\v//g;$_}<$fh>;
my @headers = split("\t",shift @lines);
@lines = map{my %temp;@temp{@headers} = split /\t/;\%temp} @lines;
@lines = sort{$a->{'qseqid'} cmp $b->{'qseqid'} or
			  $a->{'evalue'} <=> $b->{'evalue'} or
			  $b->{'ppos'} <=> $a->{'ppos'}
			  } @lines;
open my $out,">../result/Ni_result_samples226/Ni_nr_first_20180417.txt" or die $!;
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
	##############

