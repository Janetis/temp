#!perl
use strict;
use warnings;


#
#########step3##########在每一个数据库里面（COG,pfam,PRK,TIGR）挑选一个e value最小的accession###step1####
open my $fh1,"$out_dir/hitdata_0721_delCd.txt" or die $!;
open my $out,">$out_dir/hitdata_0913_delCd_min.txt" or die $!;
my %hash;
my %hash_e;
my %hash_acc;
while(<$fh1>){
	s/\v//g;
	my @line = split("\t",$_);
	my $db;
	if($line[1] =~ /(\D+)\d+/){
		$db = $1;
	}

	if(defined $hash_e{$line[0]}{$db}){
		if($line[10] < $hash_e{$line[0]}{$db} && $line[10] < 1e-3){
			$hash_e{$line[0]}{$db} = $line[10];
			$hash_acc{$line[0]}{$db} = $line[1]."\t".$line[10];
		}
	}else{
		if($line[10] < 1e-3){
		$hash_e{$line[0]}{$db} = $line[10];
		$hash_acc{$line[0]}{$db} = $line[1]."\t".$line[10];
		}
	}
}

for my $key(sort{$a cmp $b}keys %hash_acc){
	for my $key1(sort{$a cmp $b}keys %{$hash_acc{$key}}){
	print $out "$key\t";
	print $out "$hash_acc{$key}{$key1}\n";
	}
}


