package Paludis;

use 5.008008;
use strict;
use warnings;
use Carp;

use Paludis::VersionSpec;

require Exporter;
use AutoLoader;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Paludis ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
    PALUDIS_VERSION_MAJOR
    PALUDIS_VERSION_MINOR
    PALUDIS_VERSION_MICRO
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
    PALUDIS_VERSION_MAJOR
    PALUDIS_VERSION_MINOR
    PALUDIS_VERSION_MICRO
);

sub AUTOLOAD {
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    my $constname;
    our $AUTOLOAD;
    ($constname = $AUTOLOAD) =~ s/.*:://;
    croak "&Bob::constant not defined" if $constname eq 'constant';
    my ($error, $val) = constant($constname);
    if ($error) { croak $error; }
    {
    no strict 'refs';
    # Fixed between 5.005_53 and 5.005_61
#XXX    if ($] >= 5.00561) {
#XXX        *$AUTOLOAD = sub () { $val };
#XXX    }
#XXX    else {
        *$AUTOLOAD = sub { $val };
#XXX    }
    }
    goto &$AUTOLOAD;
}

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Paludis', $VERSION);

# Preloaded methods go here.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Paludis - Perl bindings for Paludis, the Other Package Mangler

=head1 SYNOPSIS

  use Paludis ':all';

  print PALUDIS_VERSION_MAJOR, ".", PALUDIS_VERSION_MINOR, ".", PALUDIS_VERSION_MICRO, "\n";

=head1 DESCRIPTION

The Paludis package provides bindings for Paludis, the Other Package
Mangler. Paludis is a multi-format package manager. It can currently be
used on Gentoo and derivatives, using the ebuild and VDB repository
formats, and on Exherbo using the exheres repository format.

At the moment, these bindings simply provide access to the
PALUDIS_VERSION constants (defining the version of paludis against which
the module was built), and to the VersionSpec object (which allows
comparing different version strings).

=head2 EXPORT

None by default.

=head2 Exportable constants

  PALUDIS_VERSION_MAJOR
  PALUDIS_VERSION_MINOR
  PALUDIS_VERSION_MICRO

=head1 SEE ALSO

L<Paludis::VersionSpec>

man paludis

paludis-sekrit@lists.pioto.org
paludis-users@lists.pioto.org

L<http://paludis.pioto.org/>

=head1 AUTHOR

Mike Kelly, E<lt>pioto@pioto.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Mike Kelly

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
