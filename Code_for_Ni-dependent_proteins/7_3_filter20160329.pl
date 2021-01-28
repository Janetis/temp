#!perl
use strict;
use warnings;



	##########################################################W
open my $fh,"../result/Ni_result_samples226/other_less3_0721_longer.txt" or die $!;

my @lines =map{chomp;$_}<$fh>;
my @headers = split("\t",shift @lines);
@lines = map{my %temp;@temp{@headers} = split /\t/;\%temp}@lines;
@lines = sort{
	$a->{'sseqid'} cmp $b->{'sseqid'} or
	$a->{'sframe'} <=> $b->{'sframe'} or
	$a->{'end_of_Ni_in_read'} <=> $b->{'end_of_Ni_in_read'} or
	$a->{'evalue'} <=> $b->{'evalue'}


}@lines;
open OUT,">../result/Ni_result_samples226/other_less3_0721_longer_E.txt" or die $!;
my $header = join("\t",@headers);
print OUT "$header\n";
my $p_key = '';
for my $i(@lines){
	my $key = join("",@$i{'sseqid','sframe','end_of_Ni_in_read'});
	if($key ne $p_key){
		$p_key = $key;
		print OUT join("\t",@$i{@headers})."\n";
	}
}
 #




































