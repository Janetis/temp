#!perl
use strict;
use warnings;
use lib "/home/xyz/xyz";
use myfile;


###############################################################33
`mkdir for_nr_blastp_pl0721_Cu226`;
my $file_name = '/home/xyz/data/for_nr_blastp_query0721_Cu226/trans_0721';
my $date = "0721";
my $file_count = 20;
my $n = 0;

for ($n..$file_count){
	$n++;
	open my $out,">for_nr_blastp_pl0721_Cu226/nr_blastp_${date}_${n}.pl";
	print $out "#!perl\nuse strict;\nuse warnings;\n".'my $query = '."\"${file_name}_$n.txt\";\n"."\`blastp -query".' $query'." -db nr_db20170511/nr -out /home/xyz/data/for_nr_blastp_query0721_Cu226/result/hitdata_${date}_$n.out -outfmt \"6 qseqid sseqid pident qstart qend sstart send qframe sframe evalue bitscore ppos length qcovs qcovhsp  qseq sseq\" > /home/xyz/data/for_nr_blastp_query0721_Cu226/log/hitdata_${date}_$n.log 2>&1\`;";
	}


