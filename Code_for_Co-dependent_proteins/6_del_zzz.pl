#!perl
use strict;
use warnings;

#########del_zzz.pl####
open my $fh,"$out_dir/other_less3_0721.txt" or die $!;
open my $out,">$out_dir/other_less3_0721_delz.txt" or die $!;
open my $out1,">$out_dir/zzz.txt" or die $!;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);

	if($line[19] =~ /zzzzzzz/){
		print $out1 "$_\n";
	}else{
		print $out "$_\n";
	}
}


