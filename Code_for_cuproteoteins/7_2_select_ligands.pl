#!perl
use strict;
use warnings;

#
#######step 1#########
open my $fh2,"../result/Cu_result_samples226/mimazi.txt" or die $!;

my %hash_mi;

while(<$fh2>){
	s/\v//g;
	my @line = split("\t",$_);
	$hash_mi{$line[0]} = $line[1];
	print "$line[0]\t$line[1]\n";
}


open my $fh,"query/Cu_top20_20170514_less0p001_ligands_add19.txt" or die $!;
my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	for my $i(1..$#line){
		my @a = split("-",$line[$i]);
		$hash{$line[0]}{$a[0]} = $a[1];
	}
}


open my $fh1,"../result/Cu_result_samples226/other_less3_0721_more50.txt" or die $!;
open my $out,">../result/Cu_result_samples226/for_ligands0721.txt" or die $!;

while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my @qbefore = split("",$line[15]);
	$line[15] =~ s/\-//g;
	my @q = split("",$line[15]);
	my @s = split("",$line[16]);
	my $qs = $line[3]-1;
	my $qe = $line[4]-1;
	my $ss;
	my $se;
	my @DNA = split ("",$line[17]);
	if($line[8]<0){
		$ss = $#DNA + 1 - $line[5];
		$se = $#DNA + 1 - $line[6];
	}else{
		$ss = $line[5] - 1;
		$se = $line[6] - 1;
	}
	my $new;
	for my $x(0...16,18..$#line-1){
		$new .= $line[$x]."\t";
	}
	$new .= $line[$#line];

	for my $i($qs..$qe){
		if(exists $hash{$line[21]}{$i}){
			my $n = $qs;
			my $m = 0;
			my $j = 0;
			for my $k(0..$#qbefore){
				if($n == $i){
					if($s[$m] eq "$qbefore[$k]"){
					my $m_minus = $m - $j;
					my $m_start = $ss+$m_minus*3;		
					my $aa = $DNA[$m_start].$DNA[$m_start+1].$DNA[$m_start+2];
						my $ligand = ($m_start-$line[18])/3;
						print $out "$new\t$i\t$hash{$line[21]}{$i}\t$m\t$s[$m]\t$ligand\t$hash_mi{$aa}\n";
					}
				}
				if($qbefore[$k] ne "-"){
					$n++;
				}
				if($s[$k] eq "-"){
					$j++;
				}
				$m++;
				
			}

		}
	}
}

