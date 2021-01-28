#!perl
use strict;
use warnings;

###########step4########arrange the above result#####
open my $fh,"../result/Co_result_samples226/Co_taxonomy_20180417.txt" or die $!;
open my $out,">../result/Co_result_samples226/taxid_class_20180417.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split/\t/;
	my $class;
	if($_ !~ /Bacteria/){
		if($_ =~ /superkingdom\t(\S+)\t/){
			print $out "$line[0]\t$line[1]\t$1\n";
		}
		next;
	}
	if($_ =~ /\tclass\t(.*?)\t/){
		$class = $1;
	}elsif($_ =~ /\tphylum\t(.*?)\t/){
		$class = "Unclassified ".$1;
	}else{
		$class = "Unclassified Bacteria";
	}
	print $out "$line[0]\t$line[1]\t$class\n";
}



