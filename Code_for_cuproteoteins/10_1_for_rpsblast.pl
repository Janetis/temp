#!perl
use strict;
use warnings;
use lib dirname(__FILE__);
use Miscellany qw( list_all_files );


`mkdir for_rpsblast_pl0721_Cu226`;
my $file_name = '/home/xyz/data/for_rpsblast_query0721_Cu226/trans_0721';
my $date = "0721";
my $file_count = 46;
my $n = 0;

for ($n..$file_count){
	$n++;
	open my $out,">for_rpsblast_pl0721_Cu226/rpsblast_${date}_${n}.pl";
	print $out "#!perl\nuse strict;\nuse warnings;\n".'my $query = '."\"${file_name}_$n.txt\";\n"."\`rpsblast -query".' $query'." -db Cdd_LE/Cdd -num_threads 0 -evalue 0.01 -out /home/xyz/data/for_rpsblast_query0721_Cu226/result/hitdata_${date}_$n.out -outfmt 7 > /home/xyz/data/for_rpsblast_query0721_Cu226/log/hitdata_${date}_$n.log 2>&1\`;";
	}

