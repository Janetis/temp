#!perl
use strict;
use warnings;
use lib "/home/xyz/xyz";
use myfile;


#######################shell all#########
open my $out,">Cu_rpsblast_0721.sh" or die $!;
for my $file(grep{m/\/rpsblast/}list_all_files("for_rpsblast_pl0721_Cu226")){
	my $name;
	if($file =~ /\/(rpsblast.*_\d+\.pl)/){
		print $out "perl /home/xyz/data/for_rpsblast_pl0721_Cu226/$1 &\n";
	}
}
#

