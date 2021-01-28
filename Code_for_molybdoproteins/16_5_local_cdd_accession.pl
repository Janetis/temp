#!perl
use strict;
use warnings;


###################################################
	open my $fh,"../result/Mo_result_samples226/hitdata_0913_delCd_min_match.txt" or die $!;
	open my $out,">../result/Mo_result_samples226/hitdata_0913_delCd_min_match_filter.txt" or die $!;
	my %hash;
	my %hash_sec;
	while(<$fh>){
		s/\v//g;
		my @line = split("\t",$_);
		if(defined $line[3] && $line[3] eq 'NuoG'){
			next;
		}
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


