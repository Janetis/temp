#!perl
use strict;
use warnings;
use lib "/home/xyz/xyz";
use myfile;


######################shell all#########
open my $out,">Mo_nr_blastp_0721_rest_rest2.sh" or die $!;
for my $file(grep{m/\/nr_blastp/}list_all_files("for_nr_blastp_pl0721_Mo226_rest_rest2")){
	my $name;
	if($file =~ /\/(nr_blastp.*_\d+\.pl)/){
		print $out "perl /home/xyz/data/for_nr_blastp_pl0721_Mo226_rest_rest2/$1 &\n";
	}
}



