#!perl
use strict;
use warnings;

my $query = "query/Ni_top20_20170510_less0p001_add20.fasta";
my $out_dir = "../result/Ni_result_samples226/tblastn_Ni_226arr_result1";
sub list_all_files{
    my $dirname = shift;
    opendir(my $dh, $dirname) or die $!;
    return map{"$dirname/$_"} grep{ $_ ne "." and $_ ne ".." } readdir($dh);
}

for my $file(grep{m/GS/} list_all_files("../runCA_226asm_arr")){
	my $dir_name;
	if($file =~ /(GS\S+)/){
		$dir_name = $1;
	}

	for my $file1(grep{m/\.fasta$/} list_all_files("$file")){
 	 `makeblastdb -in $file1 -dbtype nucl -title $dir_name -out $out_dir/$dir_name/db/$dir_name`;
     `tblastn -query $query -db $out_dir/$dir_name/db/$dir_name -out $out_dir/$dir_name/${dir_name}_20170721.out -seg no -outfmt "6 qseqid sseqid pident qstart qend sstart send qframe sframe evalue bitscore ppos length qcovs qcovhsp  qseq sseq" -max_target_seqs 100000`;
	}
}
 
 

