#!perl
use strict;
use warnings;


########## get.pl##########
open FILE,"$out_dir/for_ligands_num_0721.txt" or die $!;
my %hash;
while(<FILE>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key = $line[1]."_".$line[0];
	my $new;
	$hash{$key} = $_;
}

close FILE;

open FILEII,"$out_dir/hitdata_0721_match_all.txt" or die $!;
open OUT,">$out_dir/hitdata_0721_match_full.txt" or die $!;
while(<FILEII>){
	s/\v//g;
	my @line = split("\t",$_);
	if (exists $hash{$line[0]}){
		print OUT "$hash{$line[0]}\n";
	}
}
###
