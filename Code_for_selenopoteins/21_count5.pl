#!perl
use strict;
use warnings;

 open FILE,"sel20160106.txt" or die $!;
 my %hash;
 while(<FILE>){
 	s/\v//g;
 	my @hang = split("\t",$_);
 	$hash{$hang[0]} = $hang[1];
 }
 close FILE;

 my $n=0;
 open FILEII,"$out_dir/Se226_20170721_arr_xu3.txt" or die $!;
 open OUT,">$out_dir/Se226_20170721_arr_xu5.txt" or die $!;
 while(<FILEII>){
 	$n++;
 	s/\v//g;
 	if($n == 1){
 		my @hang = split("\t",$_);
 			for my $i(@hang){
 				if(defined $hash{$i}){
 					print OUT "$hash{$i}\t";
 				}else{
 					print OUT "$i\t";
 				}
 			}
 		print OUT "\n";
 	}else{
 		print OUT "$_\n";
 	}

 }
