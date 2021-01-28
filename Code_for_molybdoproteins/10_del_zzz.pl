#!perl
use strict;
use warnings;

#########for bac#####
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
























#open FILE,"../result/Mo_result_samples226/ppos20more_20161012_minus51.txt" or die $!;
#open OUT,">../result/Mo_result_samples226/ppos20more_20161012_minus51_delz.txt" or die $!;
#open OUTII,">../result/Mo_result_samples226/zzz.txt" or die $!;
#while(<FILE>){
	#s/\v//g;
	#my @hang = split("\t",$_);
	#my $origin = '';
	#if($hang[0] =~ /^(\d+_(\D+))_?/){
		#$hang[0] = $2;
		#$origin = $1;
	#}
	#my @array;
	#for my $i(0..$#hang){
		#push (@array,$hang[$i]);
	#}
	#my $join = join("\t",@array);
#
	#if($hang[22] =~ /zzzzzzz/){
		#print OUTII "$join\t$origin\n";
	#}else{
		#print OUT "$join\t$origin\n";
	#}
#}
	#
	#########arrange##
#open my $fh,"../result/Mo_result_samples226/ppos20more_20161012_minus51_delz.txt" or die $!;
#open my $out,">../result/Mo_result_samples226/ppos20more_20161012_minus51_delz_arr.txt" or die $!;
#
#while(<$fh>){
	#s/\v//g;
	#my @line = split("\t",$_);
	#$line[0] =~ s/_$//;
	#$line[23] =~ s/_$//;
	#my $new;
	#for my $i(0..23){
		#$new .= $line[$i]."\t";
	#}
	#print $out "$new\n";
#}
#
