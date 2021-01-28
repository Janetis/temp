#!perl
use strict;
use warnings;


####排序,然后挑选翻译序列比较长的结果#####
open FILE,"../result/Ni_result_samples226/other_less3_0721_delz_rename.txt" or die $!;
my @lines =map{s/\v//g;$_}<FILE>;
my @headers = split("\t",shift @lines);
@lines = map{my %temp;@temp{@headers} = split /\t/;\%temp}@lines;
@lines = sort{
	$a->{'qseqid'} cmp $b->{'qseqid'} or
	$a->{'sseqid'} cmp $b->{'sseqid'} or
	$a->{'sframe'} <=> $b->{'sframe'} or
	$a->{'end_of_Ni_in_read'} <=> $b->{'end_of_Ni_in_read'} or
	$a->{'start_of_Ni_in_read'} <=> $b->{'start_of_Ni_in_read'} or
	$a->{'evalue'} <=> $b->{'evalue'}
}@lines;
open OUT,">../result/Ni_result_samples226/other_less3_0721_longer.txt" or die $!;
my $header = join("\t",@headers);
print OUT "$header\n";
####
	#for my $i(@lines){
		#print OUT join("\t",@$i{@headers})."\n";
	#}
#####
my $p_key = '';
for my $i(@lines){
	my $key = join("",@$i{'qseqid','sseqid','sframe','end_of_Ni_in_read','start_of_Ni_in_read'});
	if($key ne $p_key){
		$p_key = $key;
		print OUT join("\t",@$i{@headers})."\n";
	}
}














