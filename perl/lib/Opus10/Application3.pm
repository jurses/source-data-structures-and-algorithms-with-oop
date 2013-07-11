#!/usr/bin/perl
#
#   Copyright (c) 2005 by Bruno R. Preiss, P.Eng.
#
#   $Author: brpreiss $
#   $Date: 2005/09/25 21:35:59 $
#   $RCSfile: Application3.pm,v $
#   $Revision: 1.1 $
#
#   $Id: Application3.pm,v 1.1 2005/09/25 21:35:59 brpreiss Exp $
#

use strict;

# @class Opus10::Application3
# Provides application program number 3.
package Opus10::Application3;
use Opus10::Polynomial;
use Opus10::PolynomialAsOrderedList;
use Opus10::PolynomialAsSortedList;

our $VERSION = 1.00;

# @function main
# Main program.
# @param args Command-line arguments.
# @return Zero on success; non-zero on failure.
sub main
{
    my (@args) = @_;
    my $status = 0;
    printf "Application program number 3.\n";

    my $p1 = Opus10::PolynomialAsOrderedList->new();
    $p1->addTerm(Opus10::Polynomial::Term->new(4.5, 5));
    $p1->addTerm(Opus10::Polynomial::Term->new(3.2, 14));
    printf "%s\n", $p1;
    $p1->differentiate();
    printf "%s\n", $p1;

    my $p2 = Opus10::PolynomialAsSortedList->new();
    $p2->addTerm(Opus10::Polynomial::Term->new(7.8, 0));
    $p2->addTerm(Opus10::Polynomial::Term->new(1.6, 14));
    $p2->addTerm(Opus10::Polynomial::Term->new(9.999, 27));
    printf "%s\n", $p2;
    $p2->differentiate();
    printf "%s\n", $p2;

    my $p3 = Opus10::PolynomialAsSortedList->new();
    $p3->addTerm(Opus10::Polynomial::Term->new(0.6, 13));
    $p3->addTerm(Opus10::Polynomial::Term->new(-269.973, 26));
    $p3->addTerm(Opus10::Polynomial::Term->new(1000, 1000));
    printf "%s\n", $p3;
    printf "%s\n", $p2 + $p3;

    return $status;
}

use Cwd 'abs_path';
if (abs_path($0) eq abs_path(__FILE__))
{
    no strict 'refs';
    exit &{__PACKAGE__ . '::main'}(@ARGV);
}

1;
__DATA__

=head1 MODULE C<Opus10::Application3>

=head2 CLASS C<Opus10::Application3>

Provides application program number 3.

=head3 FUNCTION C<main>

Main program.

=head4 Parameters

=over

=item C<args>

Command-line arguments.

=back

=head4 Return

Zero on success; non-zero on failure.

=cut

