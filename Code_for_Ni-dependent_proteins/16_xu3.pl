#!perl
use strict;
use warnings;

 open my $fh,"../result/Ni_result_samples226/hitdata_0913_arr_xu1.txt" or die $!;
 open my $out,">../result/Ni_result_samples226/hitdata_0913_arr_xu3.txt" or die $!;
 my %hash;
 my %sample_hash;
 ###my %query_hash;
 while(<$fh>){
 	s/\v//g;
 	my @line = split("\t",$_);
	if($line[2] =~ /(\S+?)_\S+/){
		$line[2] = $1;
	}
 	if (defined $hash{$line[0]}{$line[2]}){
 		$hash{$line[0]}{$line[2]} += $line[22];
 	}else{
 		$hash{$line[0]}{$line[2]} = $line[22];

 	}
 	$sample_hash{$line[0]} = 1;
 }

 my @query = ("Urease","Ni,Fe-hydrogenase","CODH","CODH/ACS","SodN","LarA");
 my @sample;
 print $out "sample\t";
 print "@query";
 for (my $i=0;$i<6;$i++){
 	print $out "$query[$i]\t";
 }
 print $out "\n";

 foreach my $key(sort{$a cmp $b}keys %sample_hash){
 	push (@sample,$key);
 }
 for (my $k=0;$k<179;$k++){
 	print $out "$sample[$k]\t";
 	for (my $j=0;$j<6;$j++){
 				if (defined $hash{$sample[$k]}{$query[$j]}){
 				print $out "$hash{$sample[$k]}{$query[$j]}\t";
 				}else{
 					print $out "0\t";
 				}
 	}
 	print $out "\n";
 #}
##
