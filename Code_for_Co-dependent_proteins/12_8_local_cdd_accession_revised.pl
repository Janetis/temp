#!perl
use strict;
use warnings;



open my $fh,"$out_dir/hitdata_0721_delCd_sec_min_sort.txt" or die $!;
open my $out,">$out_dir/hitdata_0721_delCd_sec_min_sort_min.txt" or die $!;

my $flag = '';
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[0] ne $flag){
		print $out "$_\n";
		$flag = $line[0];
	}
}


