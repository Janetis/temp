#!perl
use strict;
use warnings;
##
	open my $fh,"$out_dir/hitdata_0721_all.out" or die $!;
	
	my %hash;
	while(<$fh>){
		s/\v//g;
		if($_ =~ /^# Query: (\S+)/){
			$hash{$1} = 1;
		}
	}

	my $m = 0;
	for my $key(keys %hash){
		$m++;
		print "$key\n";
	}
	print "$m\n";


