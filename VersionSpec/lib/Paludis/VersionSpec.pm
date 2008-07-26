package Paludis::VersionSpec;

use 5.008008;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Paludis ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.
our %EXPORT_TAGS = ( 'all' => [ qw(
	
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	
);

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Paludis::VersionSpec', $VERSION);

# Preloaded methods go here.

use overload
    '<=>'    => \&Paludis::VersionSpec::comp,
    fallback  => 1;

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Paludis::VersionSpec - Compare different versions according to Paludis'
rules

=head1 SYNOPSIS

  use Paludis;

  my $ver0 = Paludis::VersionSpec->new("0");
  my $ver0r0 = Paludis::VersionSpec->new("0-r0");

  print "0 == 0-r0\n" if $ver0 == $ver0r0;

=head1 DESCRIPTION

The Paludis package provides bindings for Paludis, the Other Package
Mangler. Paludis is a multi-format package manager. It can currently be
used on Gentoo and derivatives, using the ebuild and VDB repository
formats, and on Exherbo using the exheres repository format.

At the moment, these bindings simply provide access the VersionSpec
object (which allows comparing different version strings).

=head2 EXPORT

None by default.



=head1 SEE ALSO

L<Paludis>

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
