#!perl
use strict;
use warnings;

my $query = "pick_Se_20170721filter_delz.fasta";

`blastp -num_threads 2 -query $query -db nr_db20170511/nr -out blastp_nr_20170721.out -seg no -outfmt "6 qseqid sseqid pident qstart qend sstart send qframe sframe evalue bitscore ppos length qcovs qcovhsp  qseq sseq" -max_target_seqs 5000 > blastp_nr_20170721.log 2>&1`;
 
 

