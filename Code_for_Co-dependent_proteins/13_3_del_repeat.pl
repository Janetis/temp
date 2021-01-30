#!perl
use strict;
use warnings;



#########step3#######
open my $fh,"$out_dir/chongfu_full.txt" or die $!;

my %hash;

while(<$fh>){
	s/\v//g;
	$hash{$_} = 1;
}

open my $fh1,"$out_dir/hitdata_0721_full_del.txt" or die $!;
open my $out,">$out_dir/hitdata_0721_full_del_repeat.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	if(exists $hash{$_}){
		next;
	}
	print $out "$_\n";
}


