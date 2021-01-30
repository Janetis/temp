#!perl
use strict;
use warnings;


#
open my $fh,"$out_dir/COG3383NuoG.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	$hash{$_} = 1;
}

open my $fh1,"$out_dir/hitdata_0913_match_all.txt" or die $!;
open my $out,">$out_dir/hitdata_0913_match_all_del.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash{$line[0]}){
		next;
	}
		print $out "$_\n";
}



##


