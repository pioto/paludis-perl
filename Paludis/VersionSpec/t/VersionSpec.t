use Test::More tests => 22;
use Test::Trap;
use Paludis;

{
    ok my $ver1 = Paludis::VersionSpec->new("1");
    isa_ok $ver1, 'Paludis::VersionSpec';
    ok my $ver2 = Paludis::VersionSpec->new("2");
    isa_ok $ver2, 'Paludis::VersionSpec';
    ok $ver2 > $ver1, '$ver2 > $ver1';
    ok $ver2 >= $ver1, '$ver2 >= $ver1';
    ok $ver1 < $ver2, '$ver1 < $ver2';
    ok $ver1 <= $ver2, '$ver1 <= $ver2';
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

{
    # compare to something that isn't a VersionSpec
    ok my $ver0 = Paludis::VersionSpec->new("0");
    my $zero = 0;
    ok my $paludis = Paludis->new();

    no warnings 'void';
    trap { $zero == $ver0; };
    like $trap->stderr, qr/not a blessed SV reference/, '$ver0 == $zero' or diag $trap->stderr;
    trap { $zero != $ver0; };
    like $trap->stderr, qr/not a blessed SV reference/, '$ver0 != $zero' or diag $trap->stderr;

    trap { $paludis == $ver0; };
    like $trap->stderr, qr/must be a VersionSpec object/, '$paludis == $ver0' or diag $trap->stderr;
    trap { $paludis != $ver0; };
    like $trap->stderr, qr/must be a VersionSpec object/, '$paludis != $ver0' or diag $trap->stderr;
    trap { $ver0 == $paludis; };
    like $trap->stderr, qr/must be a VersionSpec object/, '$ver0 == $paludis' or diag $trap->stderr;
}
