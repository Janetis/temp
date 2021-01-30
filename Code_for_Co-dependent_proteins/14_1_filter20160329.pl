#!perl
use strict;
use warnings;


############arrange########
open my $fh,"$out_dir/other_less3_0721_delz.txt" or die $!;
open my $out,">$out_dir/other_less3_0721_delz_rename.txt" or die $!;
open my $out2,">$out_dir/temp.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if(length($line[19]) < 50){
		print $out2 "$line[19]\n";
		next;

	}
		$hash{$line[0]} = 1;

	if($line[0] =~ /LitR/){
		$line[0] = "LitR/CarH/CarA";
	}elsif($line[0] =~ /CarH/){
		$line[0] = "LitR/CarH/CarA";
	}elsif($line[0] =~ /MCM/){
		$line[0] = "MCM/ICM";
	}elsif($line[0] =~ /ICM/){
		$line[0] = "MCM/ICM";
	}
	
	for my $i(0..$#line-1){
		print $out "$line[$i]\t";
	}
	print $out "$line[$#line]\n";
}

for my $key(keys %hash){
	print "$key\n";
}



