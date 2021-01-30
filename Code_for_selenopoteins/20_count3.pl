#!perl
use strict;
use warnings;

######count selenoproteins######
 open FILE,"$out_dir/Se226_20170721_arr_xu2.txt" or die $!;
 open OUT,">$out_dir/Se226_20170721_arr_xu3.txt" or die $!;
 my $n=0;
 my %hash;
 my %sample_hash;
 my %query_hash;
 while(<FILE>){
 	$n++;
 	s/\v//g;
 		my @hang = split("\t",$_);
 		if (defined $hash{$hang[0]}{$hang[2]}){
 			$hash{$hang[0]}{$hang[2]} += $hang[24];
 		}else{
 			$hash{$hang[0]}{$hang[2]} = $hang[24];

 		}
 		$sample_hash{$hang[0]} = 1;
 		$query_hash{$hang[2]} = 1;
		
 }

 my @query;
 my @sample;
 print OUT "sample\t";
 foreach my $key(sort{$a cmp $b}keys %query_hash){
 	push (@query,$key);
 }
 print "@query";
 for (my $i=0;$i<64;$i++){
 	print OUT "$query[$i]\t";
 }
 print OUT "\n";

 foreach my $key(sort{$a cmp $b}keys %sample_hash){
 	push (@sample,$key);
 }
 for (my $k=0;$k<176;$k++){
 	print OUT "$sample[$k]\t";
 	for (my $j=0;$j<64;$j++){
 				if (defined $hash{$sample[$k]}{$query[$j]}){
 				print OUT "$hash{$sample[$k]}{$query[$j]}\t";
 				}else{
 					print OUT "0\t";
 				}
 	}
 	print OUT "\n";
 }
