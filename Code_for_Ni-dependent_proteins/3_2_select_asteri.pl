#!perl
use strict;
use warnings;


###############################两个星号或一个###step2
open my $fh,"../result/Ni_result_samples226/ppos20more_0721_stop.txt" or die $!;
open my $out,">../result/Ni_result_samples226/ppos20more_0721_less3.txt" or die $!;

while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $count;
	while($line[16] =~ /\*/g){
		$count++;
		print "$count\n";
	}
	if($count < 3){
		print $out "$_\n";
	}
}
#