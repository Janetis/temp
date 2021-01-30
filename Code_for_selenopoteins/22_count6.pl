#!perl
use strict;
use warnings;

 open FILE,"$out_dir/Se226_20170721_arr_xu5.txt" or die $!;
 open OUT,">$out_dir/Se226_20170721_arr_xu6.txt" or die $!;
 my $n=0;
 my @query;
 my @query_only;
 my %hash;
 my %hash_query;
 while(<FILE>){
 	$n++;
 	s/\v//g;
 	my @hang = split("\t",$_);
 	if ($n == 1){
 		for my $i(@hang){
 			push(@query,$i);
 		}
 	}else{
 			for my $j(1..$#query){
 				$hash{$hang[0]}{$query[$j]} += $hang[$j];
 			}
 		}
 	}


 print OUT "sample\t";
 shift @query;
 for my $k(@query){
 	$hash_query{$k} = 1;
 }

 for my $f(sort{$a cmp $b}keys %hash_query){
 	push(@query_only,$f);
 }
 for my $r(@query_only){
 	print OUT "$r\t";
 }


 print OUT "\n";

 	for my $key1(sort{$a cmp $b}keys %hash){
 		print OUT "$key1\t";
 		for my $key2(@query_only){
 			print OUT "$hash{$key1}{$key2}\t";			
 		}
 		print OUT "\n";
 	}
