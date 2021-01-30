#!perl
use strict;
use warnings;
use lib "/home/xyz/xyz";
use myfile;


open my $out,">Co_rpsblast_0721.sh" or die $!;
for my $file(grep{m/\/rpsblast/}list_all_files("for_rpsblast_pl0721_Co226")){
	my $name;
	if($file =~ /\/(rpsblast.*_\d+\.pl)/){
		print $out "perl /home/xyz/data/for_rpsblast_pl0721_Co226/$1 &\n";
	}
}
#
