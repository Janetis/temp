#!perl
use strict;
use warnings;


#
	#####################
	open my $fh,"$out_dir/hitdata_0721_match_full.txt" or die $!;
	open my $out,">$out_dir/chongfu_temp.txt" or die $!;
	my %hash;
	while(<$fh>){
		s/\v//g;
		my @line = split("\t",$_);
		my $key;
		for my $i(1..16){
			$key .= $line[$i]."\t";
		}
		$key .= $line[17];
		if(exists $hash{$key}){
			print $out "$_\n";
		}else{
			$hash{$key} = 1;
		}
	}
	#
#

