# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Paludis.t'

#########################

use YAML 'Dump';

use Test::More tests => 15;
BEGIN { use_ok('Paludis') };

#########################

{
    ok my $paludis = Paludis->new();
    is $paludis->MAJOR_VERSION, 0;
    is $paludis->MINOR_VERSION, 27;
}

{
    ok my $ver1 = Paludis::VersionSpec->new("1");
    ok my $ver2 = Paludis::VersionSpec->new("2");
    ok $ver2 > $ver1, '$ver2 > $ver1';
    ok $ver1 < $ver2, '$ver1 < $ver2';
    ok $ver1 == $ver1, '$ver1 == $ver1';
    ok $ver2 == $ver2, '$ver2 == $ver2';
    ok $ver1 != $ver2, '$ver1 != $ver2';
    ok $ver2 != $ver1, '$ver2 != $ver1';
}

{
    ok my $ver20 = Paludis::VersionSpec->new("2.0");
    ok my $ver20r0 = Paludis::VersionSpec->new("2.0-r0");
    ok $ver20 == $ver20r0, '$ver20 == $ver20r0';
}
