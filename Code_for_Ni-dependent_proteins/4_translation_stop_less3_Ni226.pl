#!perl
use strict;
use warnings;


####################翻译含有stop codon的结果#######
open my $fh,"../result/Ni_result_samples226/ppos20more_0721_less3.txt" or die $!;
open my $out,">../result/Ni_result_samples226/trans_0721less3.txt" or die $!;

while(<$fh>){
	my @asteri_pos;
	my @DNA2;
	my $sequence;
	s/\v//g;
	my @line = split("\t",$_);
	my $head = $_;
	####提取出文件名
	my $myfile;
	if($line[1] =~ /,(GS\w+)/){
		$myfile = $1;
	}
#
	####存入核酸序列，用于翻译
	my %hash;
	my $key;
	##
	open my $fh1,"../runCA_226asm_arr/$myfile/$myfile.fasta" or die $1;
	while(<$fh1>){
		s/\v//g;
		if ($_ =~ /^>(\S+)/){
			$key = $1;
		}else{
			$hash{$key} = $_;
		}
	}
	close $fh1;
	##
	my @letter_query = split("",$line[15]);				#处理aligned_query_seq和aligned_subject_seq
	my @letter_subject = split("",$line[16]);
	my $k;
	if (defined( $line[8] ) && $line[8] > 0 ){
		$k = 1;
	}else {
		$k = -1;
	}

	for my $i(0..$#letter_subject){
		if($letter_subject[$i] eq '*'){
			print $out "$head\t";
			my $b;
			for my $j(0..$i){
				if($letter_subject[$j] eq '-'){
					$b++;
				}
			}
			if(defined $b){
				$i = $i-$b;
			}
	

	   $sequence = $hash{$line[1]};
	my $left_part;
	my $left_protein='';
	my $codon1;
	my $codon_ini;
	my $codon_stop;
	my $first = $k*$i*3;
	my $third = $k*$i*3+$k*2;
	my @DNA1 = split("",$sequence);
	my $v;
	my $u;

	if ($first > $third){
			$sequence = reverse $sequence;
			$sequence =~ tr/ACGT/TGCA/;
			$first = $#DNA1-($line[5]+$first-1);
			$third = $#DNA1-($line[5]+$third-1); 
	}else{
			$first = $line[5]+$first-1;
			$third = $line[5]+$third-1;
	}
	@DNA2 = split("",$sequence);
	for my $q(0..($third-1)){
		$left_part .= $DNA2[$q];	
	}
	push(@asteri_pos,$third);
	print $out "$sequence\t";
	print $out "$first..$third\t";
	print $out "$DNA2[$first]$DNA2[$first+1]$DNA2[$first+2]\t";
	##
	for (my $j=$first-1-2;$j>-1;$j-=3){
		$codon1 = substr($left_part,$j,3);		
		if ($codon1 =~ /ATG|GTG|TTG/){
			$v = $j;
		}elsif($codon1 =~ /TAA|TAG|TGA|[^ATCG]/){
			$u = $j;
			last;
		}
	}
	##
	my $position_of_start;
	if(defined $v){
		for (my $i = $v;$i <$first-1;$i+=3){
			$codon1 = substr($left_part,$i,3);
			$left_protein  .= codon2aa($codon1);
		}
			$position_of_start = $v;
			print $out "$position_of_start\t";
	}else{
		if (defined $u){
			$left_protein  = "zzzzzzz";
			print $out "\t";
		}else{
			my $a;
			for ($a=$first-1-2;$a>=0;$a-=3){
				$codon1 = substr($left_part,$a,3);
				$left_protein  = codon2aa($codon1).$left_protein;
			}
			if ($a<0){
				$a += 3;
			}
			$position_of_start = $a;
			print $out "$position_of_start\t";
		}
	}
	##
	$first = $first-1;
	print $out "$first\t";##print stop position

	print $out "$left_protein\n";

	}
}
	##
	my $right_protein='';
	my $right_part;
	my $codon2;
	my $u2;
	my $v2;
	print $out "$head\t";
	print $out "$sequence\t";
	my $s = $asteri_pos[$#asteri_pos]-2;
	print $out "$s..$asteri_pos[$#asteri_pos]\t";
	my $stop;
	for my $j($s..$asteri_pos[$#asteri_pos]){
		$stop .= $DNA2[$j]; 
	}
	print $out "$stop\t";
	for my $q($asteri_pos[$#asteri_pos]+1..$#DNA2){
		$right_part .= $DNA2[$q];	
	}
	my @right =split("",$right_part);
	my $l;
	for ($l = 0;$l<$#right-1;$l+=3){
		$codon2 = substr($right_part,$l,3);
		if($codon2 =~ /ATG|GTG|TTG/){
			if(defined $v2){
				next;
			}
			$v2 = $l;
		}elsif($codon2 =~ /TAA|TAG|TGA|[^ATCG]/){
			$u2 = $l;
			last;
		}
	}

	my $position_of_start2;
	my $position_of_end2;
	if(defined $v2){
		$position_of_start2 = $v2+$asteri_pos[$#asteri_pos]+1;
		if(defined $u2){
			for (my $i = $v2;$i <$u2-1;$i+=3){
				$codon2 = substr($right_part,$i,3);
				$right_protein  .= codon2aa($codon2);
			}
			$position_of_end2 = $u2+$asteri_pos[$#asteri_pos];
		}else{
			for(my $i = $v2;$i<$#right-1;$i+=3){
					$codon2 = substr($right_part,$i,3);
				$right_protein  .= codon2aa($codon2);
				$position_of_end2 = $i+$asteri_pos[$#asteri_pos]+3;
			}
		}
	}else{
			$right_protein  = "zzzzzzz\t";
	}
	print $out "$position_of_start2\t$position_of_end2\t";
	print $out "$right_protein\n";
	
}


##################################################subrountines#############################################
###########################################################################################################
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
#





