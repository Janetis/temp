#!perl
use strict;
use warnings;
use lib "/home/xyz/xyz";
use myfile;

open my $out,">../result/Mo_result_samples226/length50more_ppos20more_0721_all_result.txt" or die $!;

for my $file(grep{m/GS\w+$/} list_all_files("../runCA_226asm_arr")){

	my $key;
	my %hash;
##提取出文件名
	my $myfile;
	if($file =~ /_arr\/(GS\w+)$/){
		$myfile = $1;
		print "$myfile\n";
	}
	open my $fh,"$file/$myfile.fasta" or die $!;

	while(<$fh>){
		s/\v//g;
		if($_ =~ /^>(\S+)/){
			$key =$1;
		}else{
			$hash{$key} =$_;
		}
	}

	open my $fh2,"../result/Mo_result_samples226/tblastn_Mo_226arr_result/$myfile/${myfile}_20170721.out" or die $!;

	while(<$fh2>){
		s/\v//g;
		my @line = split("\t",$_);
		if($line[12] <= 50 or $line[11] <= 20){
			next;
		}



	print $out "$_\t";
	my $start_pos;
	my $stop_pos;
	my $sstart = $line[5]; 
	my $send = $line[6];	
	my $sframe;                           	                                 
	my $protein;
	my $v;
	my $u;
	my $left_part;
	my $middle_part;
	my $right_part;
	my $position_of_start = '';
	my $position_of_end = '';
	my $left_protein;
	my $right_protein;
	my $middle_protein;
	my @right;

    if(defined($line[8]) && $line[8] > 0){
    	$sframe = $line[8];
    }else{
    	$sframe = -1*$line[8];
    }
                                      
	if (not defined $hash{$line[1]}){
		print $out "####I can not find the sequence!!!!!!!\n";
		next;
	}
	my $sequence = $hash{$line[1]};
			
	if ($line[8]<0){
		$sequence = reverse $sequence;
		$sequence =~ tr/ACGT/TGCA/;
	}
	print $out "$sequence\t";
	my @DNA = split ("",$sequence);
		
	if($line[8]<0){
		$start_pos = $#DNA + 1 - $sstart;
		$stop_pos = $#DNA + 1 - $send;
	}else{
		$start_pos = $sstart - 1;
		$stop_pos = $send - 1;
	}
	
	$line[16] =~ s/-//g;
	my $ten1 = length($line[16])-10;####20161119

	my $ten_pos = $start_pos+$ten1*3;
	for my $q(0..($ten_pos-1)){
		$left_part .= $DNA[$q];
	}
			
	for my $w(($ten_pos)..$#DNA){
		$right_part .= $DNA[$w];
	}
		
	@right = split("",$right_part);
	##
	for (my $j=$ten_pos-1-2;$j>-1;$j-=3){
	my $codon1 = substr($left_part,$j,3);
		if($codon1 =~ /ATG|GTG|TTG/){
			$v = $j;
		}elsif($codon1 =~ /TAA|TAG|TGA|[^ATCG]/){
			$u=$j;
			last;
		}
	}
	##
	if (defined $v){
		for(my $i = $v;$i < $ten_pos;$i+=3){
			my $codon1 = substr($left_part,$i,3);
			$left_protein .= codon2aa($codon1);
		}
		$position_of_start = $v;
		print $out "$position_of_start\t";
	}else{
			if (defined $u){
				$left_protein = "zzzzzzz";
				print $out "\t";
			}else{
				my $a;
				for ($a = $ten_pos-1-2;$a>=0;$a-=3){
					my $codon1 = substr($left_part,$a,3);
					$left_protein = codon2aa($codon1)."$left_protein";
				}
				if($a<0){
					$a +=3;
				}
				$position_of_start = $a;
				print $out "$position_of_start\t";
				}
	}
	##

	my $l;
	for ($l=0;$l<$#right - 1;$l+=3){
		my $codon2 = substr($right_part,$l,3);
		if($codon2 =~ /TAA|TAG|TGA|[^ATCG]/){
			$right_protein .= codon2aa($codon2);
			#$l += 3;
			last;
		}
		$right_protein .= codon2aa($codon2);
	}
		$l = $l+$ten_pos-1;
	print $out "$l\t";
		
	print $out "$left_protein"."$right_protein"."\n";
}
}
###################################################subrountines#############################################
############################################################################################################
sub codon2aa {
    my($codon) = @_;

    $codon = uc $codon;
 
    my(%genetic_code) = (
    
    'TCA' => 'S',    # Serine
    'TCC' => 'S',    # Serine
    'TCG' => 'S',    # Serine
    'TCT' => 'S',    # Serine
    'TTC' => 'F',    # Phenylalanine
    'TTT' => 'F',    # Phenylalanine
    'TTA' => 'L',    # Leucine
    'TTG' => 'L',    # Leucine
    'TAC' => 'Y',    # Tyrosine
    'TAT' => 'Y',    # Tyrosine
    'TAA' => 'x',    # Stop
    'TAG' => 'x',    # Stop
    'TGC' => 'C',    # Cysteine
    'TGT' => 'C',    # Cysteine
    'TGA' => 'u',    # Sec
    'TGG' => 'W',    # Tryptophan
    'CTA' => 'L',    # Leucine
    'CTC' => 'L',    # Leucine
    'CTG' => 'L',    # Leucine
    'CTT' => 'L',    # Leucine
    'CCA' => 'P',    # Proline
    'CCC' => 'P',    # Proline
    'CCG' => 'P',    # Proline
    'CCT' => 'P',    # Proline
    'CAC' => 'H',    # Histidine
    'CAT' => 'H',    # Histidine
    'CAA' => 'Q',    # Glutamine
    'CAG' => 'Q',    # Glutamine
    'CGA' => 'R',    # Arginine
    'CGC' => 'R',    # Arginine
    'CGG' => 'R',    # Arginine
    'CGT' => 'R',    # Arginine
    'ATA' => 'I',    # Isoleucine
    'ATC' => 'I',    # Isoleucine
    'ATT' => 'I',    # Isoleucine
    'ATG' => 'M',    # Methionine
    'ACA' => 'T',    # Threonine
    'ACC' => 'T',    # Threonine
    'ACG' => 'T',    # Threonine
    'ACT' => 'T',    # Threonine
    'AAC' => 'N',    # Asparagine
    'AAT' => 'N',    # Asparagine
    'AAA' => 'K',    # Lysine
    'AAG' => 'K',    # Lysine
    'AGC' => 'S',    # Serine
    'AGT' => 'S',    # Serine
    'AGA' => 'R',    # Arginine
    'AGG' => 'R',    # Arginine
    'GTA' => 'V',    # Valine
    'GTC' => 'V',    # Valine
    'GTG' => 'V',    # Valine
    'GTT' => 'V',    # Valine
    'GCA' => 'A',    # Alanine
    'GCC' => 'A',    # Alanine
    'GCG' => 'A',    # Alanine
    'GCT' => 'A',    # Alanine
    'GAC' => 'D',    # Aspartic Acid
    'GAT' => 'D',    # Aspartic Acid
    'GAA' => 'E',    # Glutamic Acid
    'GAG' => 'E',    # Glutamic Acid
    'GGA' => 'G',    # Glycine
    'GGC' => 'G',    # Glycine
    'GGG' => 'G',    # Glycine
    'GGT' => 'G',    # Glycine

    );

    if(exists $genetic_code{$codon}) {
        return $genetic_code{$codon};
    }else{
            return '*';
    }
}


