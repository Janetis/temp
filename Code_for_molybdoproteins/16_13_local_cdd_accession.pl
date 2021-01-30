#!perl
use strict;
use warnings;


open FILE,"$out_dir/other_less3_fdhA_0721_num.txt" or die $!;
my %hash;
while(<FILE>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[1] =~ /fdhA/){
		$line[1] = "DMSOR";
	}
	my $key = $line[1]."_".$line[0];
	my $new;
	for my $i(0..$#line-1){
	$hash{$key} .= $line[$i]."\t";
	}
	$hash{$key} .= $line[$#line];
}

close FILE;

open FILEII,"$out_dir/hitdata_0913_match_all_del.txt" or die $!;
open OUT,">$out_dir/hitdata_0913_match_all_full.txt" or die $!;
while(<FILEII>){
	s/\v//g;
	my @line = split("\t",$_);
	$line[0] =~ s/fdhA/DMSOR/i;
	if (exists $hash{$line[0]}){
		print OUT "$hash{$line[0]}\n";
	}
}

