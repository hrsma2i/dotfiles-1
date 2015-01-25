#!/usr/bin/perl

use strict;
use warnings;
use FindBin;
use Cwd;

#my $root = Cwd::abs_path($0 . "/../..");
#print "$root\n";

my $cwd = getcwd;
my $root = Cwd::abs_path($FindBin::Bin . "/../..");

print "$cwd\n";
chdir $root;
#
if (-f "Makefile") {
print "$cwd\n";
    my $make_list=`make list 2>/dev/null`;
    if ($? != 0) {
        exit 1;
    }

    my @list = split(/\n/, $make_list);
    @list = map {$_ =~ s@/$@@; $_} @list;

        chdir $ENV{'HOME'};
print "$cwd\n";
    foreach my $f (@list) {
        #my $a = "$root/$f";
        #my $b = readlink("$f");
        print "f: $f\n";
        #if ($a eq $b) {
        #    print "ok: $a <-> $b\n";
        #} else {
        #    print "NG: $a\n";
        #    exit 1;
        #}
    }
} else {
    exit 1;
}