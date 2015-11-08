#!/usr/bin/perl
use strict;
my $line;
my @temp;
my %hash;
my @array;


open (INPUT, $ARGV[0]);
while (my $liney=<INPUT>){
chomp $liney;                              
my @array=split(/\t/,$liney);
if($liney !~ /^chr/){
my $in=($array[0]);
$in=~ s/_[12]\:N\:0\:.*$//;
$hash{$in}="";
}
}
close INPUT;

open (INPUT, $ARGV[1]);
while (my $liney=<INPUT>){
chomp $liney;                            
my @array=split(/\s/,$liney);
if($liney =~ /^\@HISEQ/){
my $cont=$array[0];
$cont=~ s/_[12]\:N\:0\:.*$//;
if(exists($hash{$cont})){
print "$liney\n";
print scalar <INPUT> for 1 .. 3;
    }
}
}
close INPUT;

