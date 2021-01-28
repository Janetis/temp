#!perl
use strict;
use warnings;
#
open my $fh,"../result/Mo_result_samples226/hitdata_0913_full_del_repeat.txt" or die $!;

my %hash_U;
my %hash;
my $n = 0;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[20] =~ /U/){
		#print "$_\n";
		$hash_U{$line[2]}{$line[9]} = $line[18];
		$hash{$line[0]} = 1;
	}
}

	
close $fh;
open my $fh1,"../result/Mo_result_samples226/hitdata_0913_full_del_repeat.txt" or die $!;
open my $out,">../result/Mo_result_samples226/hitdata_0913_full_del_remain.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash_U{$line[2]}{$line[9]} && $hash_U{$line[2]}{$line[9]} == $line[18] && not exists $hash{$line[0]}){
		next;
	}
		print $out "$_\n";
}

