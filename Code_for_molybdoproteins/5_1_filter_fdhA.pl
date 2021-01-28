#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

####################################################按照《GOS-tblastn结果处理》处理表格#############
####################################################去重###########################################
open FILE,"../result/Mo_result_samples226/fdhA_Mo226_trans0721.txt" or die $!;
 my @lines = map{s/\v//g;$_} <FILE>;
 my @headers = split("\t", shift @lines);
 @lines = map{my %temp; @temp{@headers} = split /\t/; \%temp } @lines;
 ###print Dumper(@lines[0..2]);
 @lines = sort{
 	$a->{'sseqid'} cmp $b->{'sseqid'} or
 	$a->{'sframe'} <=> $b->{'sframe'} or
 	$a->{'position_of_TGA_TAA_TAG'} cmp $b->{'position_of_TGA_TAA_TAG'} or
 	$a->{'evalue'} <=> $b->{'evalue'}
 } @lines;

  ###@headers = @headers[0,1,8,16,9,2..7,10..15,17,18];
  @headers = @headers[0..16,19..23];
 open OUT,">../result/Mo_result_samples226/fdhA_Mo226_trans0721filter.txt" or die $!;
 print OUT join("\t", @headers) . "\n";
 my $p_key = '';

 for my $l(@lines){
 	my $key = join(" ", @$l{'sseqid','sframe','position_of_TGA_TAA_TAG'});
 	if($key ne $p_key) {
 		$p_key = $key;
 		print OUT join("\t", @$l{@headers}) . "\n";
 	}	
 }


