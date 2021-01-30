#!perl
use strict;
use warnings;


#
#######################################3
open my $fh,"$out_dir/hitdata_0913_delCd_min.txt" or die $!;

my %hash;
my %hash_two;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash{$line[0]}{$line[2]}){
		$hash_two{$line[0]} = 1;
	}

	if($line[2] == 0){
		$hash{$line[0]}{$line[2]} = 1;
	}
}
open my $fh2,"$out_dir/hitdata_0913_delCd_min.txt" or die $1;
open my $out,">$out_dir/hitdata_0913_delCd_sec_min.txt" or die $!;
print $out "Mo_protein\taccession\tevalue\n";

while(<$fh2>){
	s/\v//g;
	my @line = split("\t",$_);
	if(exists $hash_two{$line[0]}){
			next;
	}else{
		print $out "$_\n";
	}
}

