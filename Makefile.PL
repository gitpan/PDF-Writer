#!/usr/local/bin/perl

use inc::Module::Install;

name		('PDF-Writer');
author		('Autrijus Tang <autrijus@autrijus.org>');
abstract	('PDF writer abstraction layer');
license		('perl');
version_from	('lib/PDF/Writer.pm');
requires        ( perl => 5.006 );

eval { require pdflib_pl; 1 } or
eval { require PDF::API2; PDF::API2->VERSION ge '0.40_52' } or
    die << '.';

This module requires a 'developer release' module on CPAN:

    http://search.cpan.org/dist/PDF-API2/

Please install it by downloading manually, because CPAN.pm
may not be able to find them.

You may also install "pdflib_pl.pm" from PDFLib.com instead.

.

WriteAll( sign => 1 );
