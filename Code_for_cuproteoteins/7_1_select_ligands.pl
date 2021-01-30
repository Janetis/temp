#!perl
use strict;
use warnings;

#########step 0####
open my $fh,"$out_dir/other_less3_0721_delz.txt" or die $!;
open my $out,">$out_dir/other_less3_0721_more50.txt" or die $!;
open my $out2,">$out_dir/temp.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if(length($line[20]) < 50){
		print $out2 "$line[20]\n";
		next;

	}
	$hash{$line[0]} = 1;
	for my $i(0..$#line-1){
		print $out "$line[$i]\t";
	}
	print $out "$line[$#line]\n";
}

for my $key(keys %hash){
	print "$key\n";
}
#


