#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;


open FILE,"$out_dir/pick_Se_20170721_arr.txt" or die $!;
 my @lines = map{s/\v//g;$_} <FILE>;
 my @headers = split("\t", shift @lines);
 @lines = map{my %temp; @temp{@headers} = split /\t/; \%temp } @lines;
 #print Dumper(@lines[0..2]);
 @lines = sort{
 	$a->{'Subject Seq_id'} cmp $b->{'Subject Seq_id'} or
 	$a->{'Subject frame'} <=> $b->{'Subject frame'} or
 	$a->{'position_of_TGA_TAG_TAA'} cmp $b->{'position_of_TGA_TAG_TAA'} or
 	$a->{'Evalue'} <=> $b->{'Evalue'}
 } @lines;

 # @headers = @headers[0,1,8,16,9,2..7,10..15,17,18];
 open OUT,">$out_dir/pick_Se_20170721filter.txt" or die $!;
 print OUT join("\t", @headers) . "\n";
 my $p_key = '';

 for my $l(@lines){
 	my $key = join(" ", @$l{'Subject Seq_id','Subject frame','position_of_TGA_TAG_TAA'});
 	if($key ne $p_key) {
 		$p_key = $key;
 		print OUT join("\t", @$l{@headers}) . "\n";
 	}	
 }

