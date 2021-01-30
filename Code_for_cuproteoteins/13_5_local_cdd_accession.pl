#!perl
use strict;
use warnings;


	#
##################step5
	open my $fh,"$out_dir/hitdata_0721_delCd_min_match.txt" or die $!;
	open my $out,">$out_dir/hitdata_0721_delCd_min_match_filter.txt" or die $!;
	my %hash;
	my %hash_sec;
	while(<$fh>){
		s/\v//g;
		my @line = split("\t",$_);
		if(exists $hash{$line[0]}){
			$hash_sec{$line[0]} = 1;
		}else{
			$hash{$line[0]} = 1;
		}
	}
	my $m = 0;
	for my $key(keys %hash_sec){
		$m++;
		print $out "$key\n";
	}
	print "$m\n";


