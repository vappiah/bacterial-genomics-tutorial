#!/usr/bin/env perl
use strict;
# use Data::Dumper;

@ARGV or die "Usage: $0 <prokka.faa>";

my %ignore = ('hypothetical protein'=>1);

my @gene;
while (<ARGV>) {
  next unless m/^>(\S+)\s+(.+)$/;
  push @gene, [ $1, $2 ];
}
my $N = scalar(@gene);
print STDERR "Found $N genes.\n";
# print Dumper(\@gene);

my $P = 0;
if ($N > 1) {
  for my $i (1 .. $N) {
    my $prod = $gene[$i-1][1];
    if ( !$ignore{$prod} and $gene[$i][1] eq $prod ) {
      print "$gene[$i-1][0] & $gene[$i][0] => $prod\n";
      $P++;
    }
  }
}
print STDERR "Found $P potential psuedo-genes\n";

#>MCDIFLJF_00002 Branched-chain-amino-acid aminotransferase
#MAESIKKLSYFEGKILPESEAKISIQTHALQYGTTVFGGLRGYYDKDTDNIYLFRILDHY
#QRLINSTRIMQLKLDKTKEELRDITIDLIRQCGYKENIYLRPFVYTSALQLSPRFHDVPT
#ELAIYILQLNDYLDTKHGLKTMVSSWRRFDDAVIPTLSKVSGGYVNSALAKSEAVQNGFD
#EAIFLDSRGFVSEGSAENIFLVRDGKIITPGINSSLLEGITRRSVLQIAKDNGIEVIERD
#ISRSELYISDEVFFSGTGVQIAWVSEIDHRKIGNSKMGPITKKIQSLFFNLVINKEEKYR
#HWLTPVY
#>MCDIFLJF_00003 DNA polymerase III subunit tau
#MFRSAFQFDDILGQEVALTFLKRYTSKPETIPPLLIFHGPDGTGKESTSERFIKNVLCFE
#GTSCGTCASCKAFMRNSHPDYICFPEDRGKIIAIGSEDNPEEFTIRWLIRSRLNYRPHLS

