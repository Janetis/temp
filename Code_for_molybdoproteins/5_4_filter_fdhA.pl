#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;

 ###########################
 #mannully check####
 #del_zzz.pl####del_TAG_TAA.pl####
 #########################################
 
  open my $fh,"$out_dir/fdhA_Mo226_trans0721filter_del.txt" or die $!;
open my $out,">$out_dir/fdhA_Mo226_trans0721filter_delz.txt" or die $!;
open my $out1,">$out_dir/zzz.txt" or die $!;
while(<$fh>){
	s/\v//g;
	next if $. == 1;
	my @line = split("\t",$_);
	my $origin = $line[0];
	if($line[0] =~ /fdhA|DMSOR/){
		$line[0] = "DMSOR";
	}
	my @array;
	for my $i(0..$#line){
		push (@array,$line[$i]);
	}
	my $join = join("\t",@array);

	if($line[21] =~ /zzzzzzz/){
		print $out1 "$join\t$origin\n";
	}else{
		print $out "$join\t$origin\n";
	}
}


