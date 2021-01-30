#!perl
use strict;
use warnings;

#########for bac#####
open my $fh,"$out_dir/other_less3_0721.txt" or die $!;
open my $out,">$out_dir/other_less3_0721_delz.txt" or die $!;
open my $out1,">$out_dir/zzz.txt" or die $!;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $new;
	if($line[20] =~ /zzzzzzz/){
		print $out1 "$_\n";
	}else{
		for my $i(0..20){
			$new .= $line[$i]."\t";
		}
		$new .= $line[21];
		print $out "$new\n";
	}
}

















