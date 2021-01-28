#!perl
use strict;
use warnings;

#########step2 delete the CHL MTH sd PTZ PHA items####
open my $fh,"../result/Mo_result_samples226/hitdata_0721_arr.txt" or die $!;
open my $out,">../result/Mo_result_samples226/hitdata_0721_delCd.txt" or die $!;
open my $out1,">../result/Mo_result_samples226/temp.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[1] =~ /CHL|MTH|sd|PTZ|PHA|PLN|smart/){
		print $out1 "$_\n";
		next;
	}
	if($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'PRK12814'){
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'COG0369'){
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'TIGR01931'){
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'PRK12771'){
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'PRK11749'){
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'PRK12831'){
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'cd02764'){
		next;
	}elsif($line[0] =~ /DMSOR|fdhA/ && $line[1] eq 'cd02784'){
		next;
	}



	if($line[0] =~ /^SO/ && $line[1] eq 'PRK05363'){
		next;
	}
	if($line[0] =~ /^Nitrogenase/ && $line[1] eq 'TIGR01862'){
		next;
	}elsif($line[0] =~ /^Nitrogenase/ && $line[1] eq 'pfam00148'){
		next;
	}elsif($line[0] =~ /^Nitrogenase/ && $line[1] eq 'cd01972'){
		next;
	}
	
	if($line[0] =~ /^new/ && $line[1] eq 'PRK14499'){
		next;
	}elsif($line[0] =~ /^new/ && $line[1] eq 'PRK11536'){
		next;
	}elsif($line[0] =~ /^new/ && $line[1] =~ /cd/){
		next;
	}
	if($line[0] =~ /^XO/ && $line[1] eq 'PRK09800'){
		next;
	}

	print $out "$_\n";
}


