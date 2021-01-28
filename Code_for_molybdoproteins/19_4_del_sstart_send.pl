#!perl
use strict;
use warnings;

########################将alinment part 有交集的结果删重#####step3
open my $fh,"../result/Mo_result_samples226/test_chongfu_full_sort.txt" or die $!;
open my $out,">../result/Mo_result_samples226/test_chongfu_full_F.txt" or die $!;

my $pre = '';
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $nex = $line[2]."\t".$line[9];
	my @array;
	if($nex ne $pre){
		my $start;
		my $end;
		my $now = $.;
		if($line[9] < 0){
			$start = $line[7];
			$end = $line[6];
		}else{
			$start = $line[6];
			$end = $line[7];
		}
		if($start < $end){
			print "yes\n";
		}
		my $little = $start."\t".$end;
		push(@array,$little);
		open my $fh1,"../result/Mo_result_samples226/test_chongfu_full_sort_1.txt" or die $!;
		while(<$fh1>){
			s/\v//g;
			next if $. <= $now;
			my @line_i = split("\t",$_);
			my $nex_i =  $line_i[2]."\t".$line_i[9];
			last if $nex_i ne $nex;
			my $start_i;
			my $end_i;
			my $little_i;
			my $flag = 1;
			if($line[9] < 0){
				$start_i = $line_i[7];
				$end_i = $line_i[6];
			}else{
				$start_i = $line_i[6];
				$end_i = $line_i[7];
			}
			for my $i(@array){
				my @spl = split("\t",$i);
				my $start_ii = $spl[0];
				my $end_ii = $spl[1];
				if($start_i >= $start_ii && $start_i <= $end_ii or $start_i < $start_ii && $end_i > $start_ii ){
					$flag = $flag*0;
				}

			}
			if($flag == 1){
				$little_i = $start_i."\t".$end_i;
				push(@array,$little_i);
			}
		}
	}
	for my $j(@array){
		print $out "$nex\t$j\n";
	}
	$pre = $nex;
}
#

