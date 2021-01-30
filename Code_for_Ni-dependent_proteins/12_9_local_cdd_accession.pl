#!perl
use strict;
use warnings;




##########################################################step9
open FILE,"$out_dir/hitdata_0913_delCd_sec_min_sort_min.txt" or die $!;
open OUT,">$out_dir/hitdata_0913_delCd_sec_min_match.txt" or die $!;
while(<FILE>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[0] =~ /^CODH_/ && $line[1] =~ /TIGR01702|PRK00941|pfam03063/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^CODH\/ACS_/ && $line[1] =~ /TIGR00316|COG1614|PRK09529|pfam03598/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^Ni,Fe-hydrogenase/ && $line[1] =~ /TIGR03295|COG0374|COG3261|PRK10170|pfam00374|COG3259/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^Urease/ && $line[1] =~ /PRK13207|TIGR01792|COG0804/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^SodN/ && $line[1] =~ /TIGR02753|pfam09055/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^LarA/ && $line[1] =~ /pfam09861|COG3875/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^MCR/ && $line[1] =~ /pfam02240|COG4057|TIGR03259/){
		print OUT "$_\n";
	}
}
	

