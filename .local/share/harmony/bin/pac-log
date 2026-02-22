#! /usr/bin/perl
use strict;
use warnings;

my $db_path = '/var/lib/pacman/local/';
my $args = "@ARGV";
my $pkgs = `LC_ALL=C pacman -Qi $args`;
if ($pkgs !~ m/^Name/)
{
    $args = '';
    my @lines = split /\n/,$pkgs;
    foreach my $line (@lines)
    {
        if ($line =~ m/^\S+?\/(\S+)/)
        {
            $args .= "$1 ";
        }
    }
    $pkgs = `LC_ALL=C pacman -Qi $args`;
}
my @pkgs = split /\n\n/, $pkgs;
my %pkg_hash;
my %month_hash;
@month_hash{qw/Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec/} = (1..12);
my $greatest_length = 0;
foreach my $pkg (@pkgs)
{
    my ($name,$ver,$instdate) = $pkg =~ m/Name\s+:\s+(\S+).+?Version\s+:\s+(\S+).+?Install Date\s+:\s+([^\n]+)\n/s;
    my ($month,$date,$hms,$year) = $instdate =~ m/^\S+\s+(\S+)\s+(\d+)\s+(\S+)\s+(\S+)\s*$/;
    my $pkg_name = "$name-$ver";
    my $name_length = length($pkg_name);
    $greatest_length = $name_length if ($name_length > $greatest_length);
    my $timestamp = sprintf "%s-%02d-%02d %8s",$year,$month_hash{$month},$date,$hms;
    $pkg_hash{$pkg_name} = $timestamp;
}
foreach (sort {$pkg_hash{$a} cmp $pkg_hash{$b}} sort keys %pkg_hash)
{
    printf "%-${greatest_length}s     %s\n",$_,$pkg_hash{$_};
}
