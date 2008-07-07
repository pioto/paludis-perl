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

  use Paludis;

  print "$Paludis::PALUDIS_VERSION_MAJOR.$Paludis::PALUDIS_VERSION_MINOR\n";

=head1 DESCRIPTION

Stub documentation for Paludis, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Mike Kelly, E<lt>pioto@pioto.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Mike Kelly

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.


=cut
