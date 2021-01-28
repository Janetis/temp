#!perl
use strict;
use warnings;

	######################
	open my $fh,"../result/Mo_result/hitdata_1012_arr.txt" or die $!;
	 my %hash;
	while(<$fh>){
		s/\v//g;
		next if $_ =~ /#/;
		next if $_ =~ /^\s+$/;
		my @line = split("\t",$_);
		$hash{$line[0]} = 1;
	}

		my $m = 0;
	for my $key(keys %hash){
		$m++;
		print "$key\n";
	}
	print "$m\n";


