#!perl
use strict;
use warnings;



########################
open my $fh,"$out_dir/hitdata_0721_delCd_sec_min_sort_min.txt" or die $!;
open my $out,">$out_dir/hitdata_0721_delCd_sec_min_match.txt" or die $!;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);

	if($line[0] =~ /COX_one/ && $line[1] =~ /COG0843|COG3278|pfam00115|TIGR02891|cd01663/){
		print $out "$_\n";
	}elsif($line[0] =~ /COX_two/ && $line[1] =~ /COG1622|pfam00116|pfam02790|cd13912|TIGR02866/){
		print $out "$_\n";
	}elsif($line[0] =~ /Plastocyanin/ && $line[1] =~ /COG3794|COG4454|pfam00127|PRK02710|cd04219|TIGR02656/){
		print $out "$_\n";
	}elsif($line[0] =~ /Azurin/ && $line[1] =~ /COG3241|TIGR02695|cd13922|pfam00127/){
		print $out "$_\n";
	}elsif($line[0] =~ /Nitrosocyanin/ && $line[1] =~ /TIGR03096|cd04215/){
		print $out "$_\n";
	}elsif($line[0] =~ /Ndh2/ && $line[1] =~ /COG1252|pfam07992/){
		print $out "$_\n";
	}elsif($line[0] =~ /SODC/ && $line[1] =~ /PRK10290|COG2032|pfam00080|cd00305|PLN02386|PLN02642|PRK15388|PLN02386|PLN02957/){
		print $out "$_\n";
	}elsif($line[0] =~ /CuAO/ && $line[1] =~ /COG3733|pfam07833|pfam01179|pfam02728|pfam02727|pfam07833/){
		print $out "$_\n";
	}elsif($line[0] =~ /pMMO/ && $line[1] =~ /pfam04744|TIGR03079/){
		print $out "$_\n";
	}elsif($line[0] =~ /Tyrosinase/ && $line[1] =~ /pfam00264/){
		print $out "$_\n";
	}elsif($line[0] =~ /Nitrite_reductase/ && $line[1] =~ /TIGR02376|cd11020/){
		print $out "$_\n";
	}elsif($line[0] =~ /MCO/ && $line[1] =~ /COG2132|pfam07731|pfam07732|pfam00394|cd04206|cd13892/){
		print $out "$_\n";
	}elsif($line[0] =~ /Nitrous_oxide_reductase/ && $line[1] =~ /COG4263|PRK02888|cd04223|TIGR04246|TIGR04244/){
		print $out "$_\n";
	}

}


