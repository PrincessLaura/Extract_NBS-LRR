#!/usr/bin/perl

use strict;
use warnings;
my $line;
my @temp;
my %hash;

open (INPUT, $ARGV[0]);
while($line=<INPUT>){
chomp $line;
@temp=split(/\t/,$line);
my $contig=$temp[0];
	if(!exists($hash{$contig})){
	print "$line\n";
	$hash{$contig}="";
	}
	}
close INPUT;
