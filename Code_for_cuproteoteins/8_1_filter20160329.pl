#!perl
use warnings;
use strict;
	
###############################
open my $fh,"$out_dir/for_ligands_filter0721.txt" or die $!;
open my $out,">$out_dir/for_ligands_rename0721.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	$line[0] =~ s/^\d+_//g;
	$line[0] =~ s/_family//g;
	$hash{$line[0]} = 1;
	for my $i(0..$#line-1){
		print $out "$line[$i]\t";
	}
	print $out "$line[$#line]\n";
}

my $n = 0;
for my $key(keys %hash){
	$n++;
	print "$key\n";
}
print "$n\n";
##


