#!perl
use strict;
use warnings;


#
###############################################################################

open my $fh,"../result/Mo_result_samples226/hitdata_0913_delCd_min_match.txt" or die $!;
open my $out,">../result/Mo_result_samples226/COG3383NuoG.txt" or die $!;

my %hash;
my %hash_del;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash{$line[0]} && $line[1] eq 'COG3383' or $line[3] eq 'NuoG'){
			$hash_del{$line[0]} = 1;
		}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'COG3383' or $line[3] eq 'NuoG'){
			$hash{$line[0]} = 1;
		}
		
}

for my $key(keys %hash_del){
	print $out "$key\n";
}
#

