#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

open FILE,"$out_dir/fdhA_Mo226_trans0721.txt" or die $!;
 my @lines = map{s/\v//g;$_} <FILE>;
 my @headers = split("\t", shift @lines);
 @lines = map{my %temp; @temp{@headers} = split /\t/; \%temp } @lines;
 @lines = sort{
 	$a->{'sseqid'} cmp $b->{'sseqid'} or
 	$a->{'sframe'} <=> $b->{'sframe'} or
 	$a->{'position_of_TGA_TAA_TAG'} cmp $b->{'position_of_TGA_TAA_TAG'} or
 	$a->{'evalue'} <=> $b->{'evalue'}
 } @lines;

  @headers = @headers[0..16,19..23];
 open OUT,">$out_dir/fdhA_Mo226_trans0721filter.txt" or die $!;
 print OUT join("\t", @headers) . "\n";
 my $p_key = '';

 for my $l(@lines){
 	my $key = join(" ", @$l{'sseqid','sframe','position_of_TGA_TAA_TAG'});
 	if($key ne $p_key) {
 		$p_key = $key;
 		print OUT join("\t", @$l{@headers}) . "\n";
 	}	
 }


