#!perl
use strict;
use warnings;
#
 open my $fh,"$out_dir/hitdata_0913_arr_xu1.txt" or die $!;
 open my $out,">$out_dir/hitdata_0913_arr_xu3.txt" or die $!;
 my %hash;
 my %sample_hash;
 while(<$fh>){
 	s/\v//g;
 	my @hang = split("\t",$_);
 	if (defined $hash{$hang[0]}{$hang[2]}){
 		$hash{$hang[0]}{$hang[2]} += $hang[22];
 	}else{
 		$hash{$hang[0]}{$hang[2]} = $hang[22];

 	}
 	$sample_hash{$hang[0]} = 1;
 }

 my @query = ("SO","XO","DMSOR","Nitrogenase");
 my @sample;
 print $out "sample\t";
 print "@query";
 for (my $i=0;$i<4;$i++){
 	print $out "$query[$i]\t";
 }
 print $out "\n";

 foreach my $key(sort{$a cmp $b}keys %sample_hash){
 	push (@sample,$key);
 }
 for (my $k=0;$k<179;$k++){
 	print $out "$sample[$k]\t";
 	for (my $j=0;$j<4;$j++){
 				if (defined $hash{$sample[$k]}{$query[$j]}){
 				print $out "$hash{$sample[$k]}{$query[$j]}\t";
 				}else{
 					print $out "0\t";
 				}
 	}
 	print $out "\n";
 }

