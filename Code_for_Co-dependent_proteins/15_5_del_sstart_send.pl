#!perl
use strict;
use warnings;


	##########################
open my $fh,"$out_dir/test_chongfu_full_F.txt" or die $!;

my %hash;
my @array;
while(<$fh>){
	s/\v//g;
	$hash{$_} = 1;
}

my $m = 0;

for my $key(keys %hash){
	$m++;
}
print "$m\n";

open my $fh1,"$out_dir/test_chongfu_full_sort.txt" or die $!;
open my $out,">$out_dir/test_chongfu_full_sort_arr.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $start = $line[6];
	my $end = $line[7];
	if($start > $end){
		$end = $line[6];
		$start = $line[7];
	}
	my $key = $line[2]."\t".$line[9]."\t".$start."\t".$end;
	if(exists $hash{$key}){
		delete($hash{$key}); ###删除一个哈希键值
		print $out "$_\n";
	}
}

