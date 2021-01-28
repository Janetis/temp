#!perl
use strict;
use warnings;
use lib "/home/xyz/xyz";
use myfile;


##############################################################33
`mkdir for_nr_blastp_pl0721_Mo226_rest_rest2`;
my $file_name = '/home/xyz/data/for_nr_blastp_query0721_Mo226_rest_rest2/trans_0721';
my $date = "0721";
my $file_count = 39;
my $n = 0;

for ($n..$file_count){
	$n++;
	open my $out,">for_nr_blastp_pl0721_Mo226_rest_rest2/nr_blastp_${date}_${n}.pl";
	print $out "#!perl\nuse strict;\nuse warnings;\n".'my $query = '."\"${file_name}_$n.txt\";\n"."\`blastp -query".' $query'.' -evalue 1'." -db nr_db20170511/nr -out /home/xyz/data/for_nr_blastp_query0721_Mo226_rest_rest2/result/hitdata_${date}_$n.out -outfmt \"6 qseqid sseqid pident qstart qend sstart send qframe sframe evalue bitscore ppos length qcovs qcovhsp\" > /home/xyz/data/for_nr_blastp_query0721_Mo226_rest_rest2/log/hitdata_${date}_$n.log 2>&1\`;";
	}


