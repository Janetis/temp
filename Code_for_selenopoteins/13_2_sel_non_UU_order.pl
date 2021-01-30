#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;




######################################################
open FILE,"$out_dir/non_UU_arr20170721.txt" or die $!;
my @lines = map{s/\v//g;$_} <FILE>;
my @headers = split("\t", shift @lines);
@lines = map{my %temp; @temp{@headers} = split /\t/; \%temp } @lines;
@lines = sort{
	$a->{'Query Seq_id'} cmp $b->{'Query Seq_id'} or
	$a->{'Evalue'} <=> $b->{'Evalue'}
	} @lines;
open OUT,">$out_dir/blastp_nr_non_UU_order20170721.txt" or die $!;
print OUT join("\t", @headers) . "\n";
 		for my $l(@lines){
 			print OUT join("\t", @$l{@headers}) . "\n";
 		}	

