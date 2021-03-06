#!/usr/bin/perl
#
#   Copyright (c) 2005 by Bruno R. Preiss, P.Eng.
#
#   $Author: brpreiss $
#   $Date: 2005/09/25 23:52:40 $
#   $RCSfile: DepthFirstBranchAndBoundSolver.pm,v $
#   $Revision: 1.2 $
#
#   $Id: DepthFirstBranchAndBoundSolver.pm,v 1.2 2005/09/25 23:52:40 brpreiss Exp $
#

use strict;

#{
# @class Opus10::DepthFirstBranchAndBoundSolver
# Depth-first branch-and-bound problem solver.
package Opus10::DepthFirstBranchAndBoundSolver;
use Carp;
use Opus10::Declarators;
use Opus10::Solver;
use Opus10::QueueAsLinkedList;
our @ISA = qw(Opus10::Solver);

#}>head

our $VERSION = 1.00;

#{
# @method initialize
# Initializes this sorter.
# @param self This sorter.
sub initialize
{
    my ($self) = @_;
    return if $self->isInitialized();
    $self->SUPER::initialize();
}

destructor qw(DESTROY);

# @method search
# Does a depth-first traversal of the solution space
# starting from the given initial node.
# Prunes subtrees from the search space when the lower bound
# on the value of the objective function for a subtree 
# exceeds that of the best solution already found.
# @param self This solver.
# @param current A node in the solution space of a problem.
sub search
{
    my ($self, $current) = @_;
    if ($current->isComplete())
    {
	$self->updateBest($current);
    }
    else
    {
	my $successors = $current->successors();
	while (defined(my $succ = $successors->()))
	{
	    if ($succ->isFeasible() &&
		$succ->getBound() < $self->{_bestObjective})
	    {
		$self->search($succ);
	    }
	}
    }
}
#}>a

1;
__DATA__

=head1 MODULE C<Opus10::DepthFirstBranchAndBoundSolver>

=head2 CLASS C<Opus10::DepthFirstBranchAndBoundSolver>

=head3 Base Classes

=over

=item C<Opus10::Solver>

=back

Depth-first branch-and-bound problem solver.

=head3 METHOD C<initialize>

Initializes this sorter.

=head4 Parameters

=over

=item C<self>

This sorter.

=back

=head3 METHOD C<search>

Does a depth-first traversal of the solution space
starting from the given initial node.
Prunes subtrees from the search space when the lower bound
on the value of the objective function for a subtree 
exceeds that of the best solution already found.

=head4 Parameters

=over

=item C<self>

This solver.

=item C<current>

A node in the solution space of a problem.

=back

=cut

