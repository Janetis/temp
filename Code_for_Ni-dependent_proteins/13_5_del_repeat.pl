#!perl
use strict;
use warnings;


##############step5########
open my $fh,"../result/Ni_result_samples226/chongfu_full_sort.txt" or die $!;
open my $out,">>../result/Ni_result_samples226/hitdata_0913_full_del_repeat.txt" or die $!;

my %hash;
my $key = '';
my $len = '';
my $qstart;
my $qend;
while(<$fh>){
	s/\v//g;
	next if $. == 1;
	my @line = split("\t",$_);
	if($line[9] > 0){
		$line[9] = "pos";
	}elsif($line[9] < 0){
		$line[9] = "neg";
	}
	my $key_new = $line[2]."\t".$line[9]."\t".$line[21];
	my $len_new = length($line[20]);
	if($key_new ne $key){
		$key = $key_new;
		$len = $len_new;
		$qstart = $line[4];
		$qend = $line[5];
		$hash{$key_new} = $_;
	}else{
		my $minus = $line[4] - $qend;
		if($minus > -10 && $len_new > $len){
			$hash{$key_new} = $_;
		}elsif($minus <= -10){
			$key_new .= "\tmore";
			$hash{$key_new} = $_;
		}

	}
}

for my $key(sort{$a cmp $b}keys %hash){
	print $out "$hash{$key}\n";
}



	
	




