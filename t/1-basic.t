#!/usr/bin/perl
use strict;
print "1..2\n";

require PDF::Writer;
print "ok 1 # loading the module\n";

my $writer = PDF::Writer->new;
$writer->can('close') or print "not ";
print "ok 2 # basic API sanity\n";
