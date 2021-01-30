#!perl
use strict;
use warnings;

 open my $fh,"$out_dir/Se226_20170721_arr_xu1.txt" or die $!;
 open my $out,">$out_dir/Se226_20170721_arr_xu2.txt" or die $!;
 while(<$fh>){
	s/\v//g;
 	my @line = split("\t",$_);
 	if($line[2] =~ /^(No.\d+)_\d+/){
 		$line[2] = $1;
 		print $out "$line[0]\t$line[1]\t$line[2]\t$line[3]\t$line[4]\t$line[5]\t$line[6]\t$line[7]\t$line[8]\t$line[9]\t$line[10]\t$line[11]\t$line[12]\t$line[13]\t$line[14]\t$line[15]\t$line[16]\t$line[17]\t$line[18]\t$line[19]\t$line[20]\t$line[21]\t$line[22]\t$line[23]\t$line[24]\n";
 	}else{
 		print $out "$_\n";
 	}
 }
