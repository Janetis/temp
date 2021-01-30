#!perl
use strict;
use warnings;


######step2 把含有两个ligand或以上的结果保留下来#####
open my $fh,"$out_dir/for_ligands0721.txt" or die $!;
open my $out,">$out_dir/for_ligands_filter0721.txt" or die $!;

my %hash;
my %hash_filter;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	my $k;
	if(exists $line[26] && $line[24] eq $line[26]){
		for my $i(0..19){
			$k .= $line[$i]."\t";
		}
		$k .= $line[20];
		if(exists $hash{$k}){
			if(exists $hash_filter{$k}){
				$hash_filter{$k} .= "\t"."$line[25]\t$line[26]"; 
			}else{
				$hash_filter{$k} = $hash{$k}. "\t"."$line[25]\t$line[26]";
			}
		}else{
			$hash{$k} = "$line[25]\t$line[26]";
		}
	}
}

for my $key(keys %hash_filter){
	print $out "$key\t$hash_filter{$key}\n";
}
