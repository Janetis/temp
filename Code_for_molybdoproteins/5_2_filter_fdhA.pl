#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

 ###########################
 #mannully check####
 #del_zzz.pl####del_TAG_TAA.pl####
 #########################################
 
 open my $fh,"../result/Mo_result_samples226/other_less3_fdhA_0721.txt" or die $!;
open my $out,">../result/Mo_result_samples226/other_less3_fdhA_0721_delz.txt" or die $!;
open my $out1,">../result/Mo_result_samples226/zzz.txt" or die $!;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $new;
	if($line[19] =~ /zzzzzzz/){
		print $out1 "$_\n";
	}else{
		for my $i(0..19){
			$new .= $line[$i]."\t";
		}
		$new .= $line[20];
		print $out "$new\n";
	}
}

 
