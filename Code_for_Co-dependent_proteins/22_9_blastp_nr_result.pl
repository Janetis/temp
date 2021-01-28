#!perl
use strict;
use warnings;


	
	###########for statistic##########
open my $fh,"../result/Co_result_samples226/Co_nr_arrange1_20180417.txt" or die $!;
open my $out,">../result/Co_result_samples226/Co_nr_stat_20180417.txt" or die $!;

my %hash;
my %hash_protein;
while(<$fh>){
	s/\v//g;
	my @line = split/\t/;
	if($line[0] =~ /,GS\w\w\w_(.*?)_\d+/){
		$line[0] = $1;
	}
	$hash{$line[0]}{$line[3]} += $line[4];
	$hash_protein{$line[3]} = $line[4];
}

my @protein;
for my $key(sort{$a cmp $b}keys %hash_protein){
	push(@protein,$key);
}
my $pro = join("\t",@protein);
print $out "Co\t";
print $out "$pro\n";
for my $key(keys %hash){
	print $out "$key\t";
	for my $key2(@protein){
		if(exists $hash{$key}{$key2}){
			print $out "$hash{$key}{$key2}\t";
		}else{
			print $out "0\t";
		}
	}
	print $out "\n";
}
		


			







