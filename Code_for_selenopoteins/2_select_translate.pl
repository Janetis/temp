#!perl
use strict;
use warnings;
use File::Basename;
use Data::Dumper;


open OUT,">$out_dir/pick_Se_20170721.txt" or die $!;
sub list_all_files{
    my $dirname = shift;
    opendir(my $dh, $dirname) or die $!;
    return map{"$dirname/$_"} grep{ $_ ne "." and $_ ne ".." } readdir($dh);
}
my $key;
for my $file(grep{m/GS/} list_all_files("../runCA_226asm_arr")){
	my %hash;
	my $myfile;
#	if($file1 =~ /\/([^\/]+)\.fasta$/){
	if($file =~ /(GS\S+)/){
		$myfile = $1;
		print "$myfile\n";
	}	
	for my $file1(grep{m/\.fasta$/} list_all_files("$file")){
#	print "$file\n";
	open my $fh1,"$file1" or die $!;
	while(<$fh1>){
		s/\v//g;
		if ($_ =~ /^>(\S+)/){
			$key = $1;
		}else{
			$hash{$key} = $_;
		}
	}
	for my $file2(grep{m/\Q$myfile\E$/} list_all_files("$out_dir/tblastn_226arr_result")){
		for my $file3(grep{m/_20170721\.out$/} list_all_files($file2)){
			open my $fh2,"$file3" or die $!;
			while(<$fh2>){									
				s/\v//g;
				my @line = split("\t",$_);
				my @letter_query = split("",$line[15]);				
				my @letter_subject = split("",$line[16]);
				my $k;
				if ( defined( $line[8] ) && $line[8] > 0 ) {
					$k = 1;
				}else {
					$k = -1;
				}

				for my $i(0..$#letter_query){
					if ( $letter_query[$i] eq 'U' and $letter_subject[$i] eq '*') { 	        	
						print OUT "$_\t";
						my $b;														  
						for my $j(0..$i){
							if ($letter_subject[$j] eq '-'){
								$b++;
							}
						}
					if (defined $b){
						$i=$i-$b;
					}
					if (not defined $hash{$line[1]}){
						print OUT "###$myfile\t$file2\t$file3\n";
						last;
					}
					my $sequence = $hash{$line[1]};
					my $left_part;
					my $right_part;
					my $left_protein='';
					my $right_protein='';
					my $codon1;
					my $codon2;
					my $codon_ini;
					my $codon_stop;
					my $first = $k*$i*3;
					my $third = $k*$i*3+$k*2;
					my $TGA_start_pos;
					my $TGA_end_pos;
					my @DNA1 = split("",$sequence);
					my $v;
					my $u;
			


					if ($first > $third){
						$sequence = reverse $sequence;
						$sequence =~ tr/ACGT/TGCA/;
						$TGA_start_pos = $#DNA1-($line[5]+$first-1);
						$TGA_end_pos = $#DNA1-($line[5]+$third-1); 
					}else{
						$TGA_start_pos = $line[5]+$first-1;
						$TGA_end_pos = $line[5]+$third-1;
					}

					print OUT "$TGA_start_pos..$TGA_end_pos\t";
					print OUT "$sequence\t";
				   
		
					my @DNA2 = split("",$sequence);
					
					for my $q(0..($TGA_start_pos-1)){
						$left_part .= $DNA2[$q];	
					}

					print OUT "$DNA2[$TGA_start_pos]$DNA2[$TGA_start_pos+1]$DNA2[$TGA_start_pos+2]\t";

					
					for my $w(($TGA_end_pos+1)..$#DNA2){
						$right_part .= $DNA2[$w];
					}
		
					my @right =split("",$right_part);
				
					for (my $j=$TGA_start_pos-1-2;$j>-1;$j-=3){
						$codon1 = substr($left_part,$j,3);
					
						if ($codon1 =~ /ATG|GTG|TTG/){
							$v = $j;

						}elsif($codon1 =~ /TAA|TAG|TGA/){
							$u = $j;
							last;
						}
						
					}

					my $position_of_start;
					if(defined $v){
						for (my $i = $v;$i <$TGA_start_pos-1;$i+=3){
							$codon1 = substr($left_part,$i,3);
							$left_protein  .= codon2aa($codon1);
						}
						$position_of_start = $v;
						print OUT "$position_of_start\t";
					}else{
						if (defined $u){
							$left_protein  = "zzzzzzz";
							print OUT "\t";
						}else{
							my $a;
							for ($a=$TGA_start_pos-1-2;$a>=0;$a-=3){
								$codon1 = substr($left_part,$a,3);
								$left_protein  = codon2aa($codon1).$left_protein;
							}
							if ($a<0){
								$a += 3;
							}
							$position_of_start = $a;
							print OUT "$position_of_start\t";
						}
					}

					my $l;
					for ($l=0;$l<$#right - 1;$l+=3){
						$codon2 = substr($right_part,$l,3);	
					
						if ($codon2 =~ /TAA|TAG|TGA/){
							$right_protein .= codon2aa($codon2);
							$l += 3;
							last;
						}
						$right_protein .= codon2aa($codon2);
					}
					$l += 3;
					$l += $position_of_start; 
					$l += ($TGA_start_pos-$position_of_start-1);
					print OUT "$l\t";
					print OUT "$left_protein"."U"."$right_protein"."\n";
			
				}
			}
		}
    }
	}
}
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
