#!perl
use strict;
use warnings;

my $query = "query/Co_top20_20161218_less0p001_add63.fasta";
my $out_dir = "../result/Co_result_samples226/tblastn_Co_226arr_result";
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
     `tblastn -num_threads 7 -query $query -db $out_dir/$dir_name/db/$dir_name -out $out_dir/$dir_name/${dir_name}_20170721.out -seg no -outfmt "6 qseqid sseqid pident qstart qend sstart send qframe sframe evalue bitscore ppos length qcovs qcovhsp  qseq sseq" -max_target_seqs 100000`;
	}
}
 
 

