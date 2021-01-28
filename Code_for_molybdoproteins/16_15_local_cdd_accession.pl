#!perl
use strict;
use warnings;


#

#####################33
open my $fh,"../result/Mo_result_samples226/chongfu_temp.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key;
	for my $i(1..16){
		$key .= $line[$i]."\t";
	}
	$key .= $line[17];
	$hash{$key} = 1;
}

open my $fh1,"../result/Mo_result_samples226/hitdata_0913_match_all_full.txt" or die $!;
open my $out,">../result/Mo_result_samples226/chongfu_full_longer.txt" or die $!;

my %hash_new;
my %hash_full;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $key;
	for my $i(1..16){
		$key .= $line[$i]."\t";
	}
	$key .= $line[17];
	my $len = length($line[20]);
	if(exists $hash{$key}){
		if(exists $hash_new{$key}){	
			if($len > $hash_new{$key}){
				$hash_new{$key} = $len;
				$hash_full{$key} = $_;
			}
		}else{
			$hash_new{$key} = $len;
			$hash_full{$key} = $_;
		}

	}
}

for my $key(keys %hash_new){
	print $out "$hash_full{$key}\n";
}
	





