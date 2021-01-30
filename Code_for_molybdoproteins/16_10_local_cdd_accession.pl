#!perl
use strict;
use warnings;


#
###############################333
open FILE,"$out_dir/hitdata_0913_delCd_sec_min_sort_min.txt" or die $!;
open OUT,">$out_dir/hitdata_0913_delCd_sec_min_match.txt" or die $!;
while(<FILE>){
	s/\v//g;
	my @line = split("\t",$_);
	if ($line[0] =~ /^SO/ && $line[1] =~ /cd02107|cd02111|cd02114|cd02113|cd00321|cd02110|cd02108|cd02109|TIGR04555|pfam00174|COG1791/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^XO/  && $line[1] =~ /TIGR02416|TIGR03311|pfam01315|TIGR03196|pfam02738|TIGR03194|TIGR02965|COG4631|PRK09970|COG1529|TIGR03311/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^AOR/ && $line[1] =~ /COG2414|PRK09849|pfam01314|pfam02730/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^Nitrogenase/ && $line[1] =~ /cd01967|cd01976|TIGR01282|COG2710/){
		print OUT "$_\n";
	}elsif($line[0] =~ /^new/ && $line[1] =~ /pfam03473|COG3217|COG2258/){
		print OUT "$_\n";
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] =~ /PRK07860|PRK09130|PRK08166|COG1034|TIGR01973|pfam10588/){
		#######print OUT "$_\tNuoG\n";
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] =~ /cd00368|cd02760|cd02750|cd02753|cd02783|cd02763|cd02794|cd02770|cd02751|cd02765|cd02791|cd02786|cd02752|cd02755|cd02759|cd02762|cd02757|TIGR02693|cd02756|cd02758|PRK14991|cd02767|TIGR01701|cd02758|PRK14991|cd02766|cd02754|pfam01568|PRK15102|TIGR00509|COG5013|TIGR01553|pfam00384|COG0243|PRK13532|TIGR01580|TIGR01706|PRK14990|pfam04879|COG3383|PRK15488|TIGR02164|TIGR02166|TIGR01591|TIGR03479|COG1029|TIGR03129|COG1153|PRK14993|TIGR03149|cd02752|cd02763|cd02770|cd02777|cd02764|cd02773|cd02753|cd02756|cd02792|cd02757|cd02767|cd02751|cd02782|cd02783|cd02766|cd02774|cd02755|cd02793|cd02754|cd02786|cd02791|cd02780|cd02775|cd02789|cd02759|cd02761|cd02769|cl09929|cd02785|cd02790|cd02784|cd00508|cd02760|cd02750|cd02781|cd02778|cd02779|cd02794|cd02765|cd02762|cd02776|cd02758|cd02787/){
		print OUT "$_\n";
	}

}
#
