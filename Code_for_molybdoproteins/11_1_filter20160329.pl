#!perl


open my $fh,"$out_dir/other_less3_fdhA_0721_delz.txt" or die $!;
open my $out,">$out_dir/other_less3_fdhA_0721_delz_rename.txt" or die $!;
open my $out2,">$out_dir/temp.txt" or die $!;

my %hash;
while(<$fh>){
	s/\v//g;
	my @line = split("\t",$_);
	if($line[0] =~ /fdhA/){
		$line[0] = "DMSOR";
	}
	if(length($line[19]) < 50){
		print $out2 "$line[19]\n";
		next;

	}
	$hash{$line[0]} = 1;
	for my $i(0..$#line-1){
		print $out "$line[$i]\t";
	}
	print $out "$line[$#line]\n";
}

for my $key(keys %hash){
	print "$key\n";
}
#


