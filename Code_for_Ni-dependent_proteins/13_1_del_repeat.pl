#!perl
use strict;
use warnings;


#####step1########
open my $fh,"$out_dir/hitdata_0913_match_all_full.txt" or die $!;
open my $out,">$out_dir/chongfu.txt" or die $!;

my %hash;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
		if($line[9] > 0){
		$line[9] = "pos";
	}elsif($line[9] < 0){
		$line[9] = "neg";
	}

	my $key = $line[21]."\t".$line[2]."\t".$line[9];
	if(exists $hash{$key}){
		print $out "$_\n";
	}else{
		$hash{$key} = 1;
	}
}


