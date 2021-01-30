#!perl
# Usage:
# perl 1_tblastn.pl query.fasta path/to/dataset/top/dir path/to/out/dir 8

use strict;
use warnings;
use File::Basename;
use lib dirname(__FILE__);
use Miscellany qw( list_all_files );

my ($query, $top_dir, $out_dir, $num_threads) = @ARGV;

for my $dataset_dir(grep{m/GS/} list_all_files("$top_dir")){
	my $title;
	if($dataset_dir =~ /(GS\S+)/){
		$title = $1;
	}

	for my $fasta_file(grep{m/\.fasta$/} list_all_files("$dataset_dir")){
 	 `makeblastdb -in $fasta_file -dbtype nucl -title $title -out $out_dir/$title/db/$title`;
     `tblastn -num_threads $num_threads -query $query -db $out_dir/$title/db/$title -out $out_dir/$title/${title}.out -seg no -outfmt "6 qseqid sseqid pident qstart qend sstart send qframe sframe evalue bitscore ppos length qcovs qcovhsp  qseq sseq" -max_target_seqs 100000`;
	}
}
 
 

