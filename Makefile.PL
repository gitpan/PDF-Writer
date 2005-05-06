#!/usr/local/bin/perl

use inc::Module::Install;

name		('PDF-Writer');
author		('Autrijus Tang <autrijus@autrijus.org>');
abstract	('PDF writer abstraction layer');
license		('perl');
version_from	('lib/PDF/Writer.pm');
requires        ( perl => 5.006 );
requires        ( 'PDF::API2' => '0.40' );

eval { require pdflib_pl; 1 } or
eval { require PDF::API2; PDF::API2->VERSION ge '0.40' } or
    warn << '.';

This module requires either PDF::API2 or pdflib_pl on your system.
We list the first one as our dependency because it is freely available
on CPAN, but pdflib_pl will also work with this module.

.

WriteAll( sign => 1 );
