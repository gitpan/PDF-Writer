package PDF::Writer;
$PDF::Writer::VERSION = '0.04';

use strict;
use vars '$Backend';

=head1 NAME

PDF::Writer - PDF writer abstraction layer

=head1 VERSION

This document describes version 0.04 of PDF::Writer, released May 6,
2005.

=head1 SYNOPSIS

    use PDF::Writer;
    # use PDF::Writer 'pdflib'; # explicitly specify a backend

    $writer = PDF::Writer->new;

=head1 DESCRIPTION

This module is an abstract class to common PDF manipulation methods;
the real work is implemented as backends, which is selected in runtime.
the capability.

Currently, two backends are available: C<pdfapi2> for L<PDF::API2>
on CPAN, and C<pdflib> for B<pdflib_pl> on L<http://www.pdflib.com/>.

If both are present, C<pdfapi2> is preferred.

=head1 METHODS

Sorry, but documentation is not yet written.  Meanwhile, please see the
source code of L<PDF::Writer::pdflib> or L<PDF::Writer::pdfapi2> for a
list of supported methods.

=cut

sub import {
    my $class = shift;
    $Backend = shift if @_;
}

sub new {
    my $class = shift;

    my $backend = $Backend || (
        eval { require PDF::API2; 1 } ? 'pdfapi2' :
        eval { require pdflib_pl; 1 } ? 'pdflib' : undef
    );

    if ($backend) {
        require "PDF/Writer/$backend.pm";
    }
    else {
        die "No supported PDF backends found!";
    }

    $class .= "::$backend";
    return $class->new(@_);
}

1;

=head1 AUTHORS

Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>

=head1 COPYRIGHT

Copyright 2004, 2005 by Autrijus Tang E<lt>autrijus@autrijus.orgE<gt>.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
