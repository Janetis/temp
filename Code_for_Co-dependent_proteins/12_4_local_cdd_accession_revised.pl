#!perl
use strict;
use warnings;



##############step4######

open my $fh,"../result/Co_result_samples226/hitdata_0721_delCd_min.txt" or die $!;
open my $out,">../result/Co_result_samples226/hitdata_0721_delCd_min_match.txt" or die $!;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[0] =~ /^D-lysine/ && $line[2] == 0 && $line[1] =~ /pfam02310|pfam16554|pfam09043|COG5012|PRK02261/){
		print $out "$_\n";
	}elsif($line[0] =~ /^CprA/ && $line[2] == 0 && $line[1] =~ /TIGR02486|pfam13486/){
		print $out "$_\n";
	}elsif($line[0] =~ /^MGM/ && $line[2] == 0 && $line[1] =~ /TIGR00640|PRK02261/){
		print $out "$_\n";
	}elsif($line[0] =~ /^RNRII/ && $line[2] == 0 && $line[1] =~ /cd01676|PRK08270|TIGR02504|PRK08332|PRK06556|pfam02867|TIGR02505|PRK08665|pfam08471|cd02888|PRK06948|PRK08115/){
		print $out "$_\n";
	}elsif($line[0] =~ /^GM/ && $line[2] == 0 && $line[1] =~ /TIGR01501|pfam02310|PRK02261|cd02072/){
		print $out "$_\n";
	}elsif($line[0] =~ /^MtrA/ && $line[2] == 0 && $line[1] =~ /COG4063|PRK00964|pfam04208|TIGR01111/){
		print $out "$_\n";
	}elsif($line[0] =~ /^EAL/ && $line[2] == 0 && $line[1] =~ /pfam06751|COG4303|PRK15067|TIGR02638/){
		print $out "$_\n";
	}elsif($line[0] =~ /^DDH/ && $line[2] == 0 && $line[1] =~ /COG4909|PRK15444|pfam02286/){
		print $out "$_\n";
	}elsif($line[0] =~ /^B12-dependent_methyltransferases/ && $line[2] == 0 && $line[1] =~ /pfam02310|TIGR02370|COG5012|PRK09490|cd02070/){
		print $out "$_\n";
	}elsif($line[0] =~ /^MCM\/ICM/ && $line[2] == 0 && $line[1] =~ /TIGR00641|pfam02310|pfam01642|COG2185|TIGR00640|COG1884|PRK09426|cd03678|cd03681|cd03677|pfam01642|TIGR00642|cd02071|cd03679|cd03680/){
		print $out "$_\n";
	}elsif($line[0] =~ /^MetH/ && $line[2] == 0 && $line[1] =~ /pfam02607|TIGR02082|COG1410|PRK09490|pfam02965|cd02070|PRK07535|COG0646/){
		print $out "$_\n";
	}elsif($line[0] =~ /^PpaA/ && $line[2] == 0 && $line[1] =~ /pfam02310|pfam02607|cd2065|cd02071|COG5012|TIGR00640|COG2185|pfam02310/){
		print $out "$_\n";
	}elsif($line[0] =~ /^QueG/ && $line[2] == 0 && $line[1] =~ /pfam08331|TIGR00276|COG1600/){
		print $out "$_\n";
	}elsif($line[0] =~ /^LitR\/CarH\/CarA/ && $line[2] == 0 && $line[1] =~ /cd01104|pfam02607|pfam02310/){
		print $out "$_\n";
	}
}



