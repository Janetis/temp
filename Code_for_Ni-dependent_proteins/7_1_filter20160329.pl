#!perl
use strict;
use warnings;

#############################氨基酸少于50个的蛋白剔除掉
open my $fh,"../result/Ni_result_samples226/other_less3_0721_delz.txt" or die $!;
open my $out,">../result/Ni_result_samples226/other_less3_0721_delz_rename.txt" or die $!;
open my $out2,">../result/Ni_result_samples226/temp.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if(length($line[19]) < 50){
		print $out2 "$line[19]\n";
		next;

	}
	$hash{$line[0]} = 1;
	for my $i(0..$#line-1){
		print $out "$line[$i]\t";
	}
	print $out "$line[$#line]\n";
}

for my $key(keys %hash){
	print "$key\n";
}













