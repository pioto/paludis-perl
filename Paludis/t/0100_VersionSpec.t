use Test::More tests => 13;
use Paludis;

{
    ok my $ver1 = Paludis::VersionSpec->new("1");
    ok my $ver2 = Paludis::VersionSpec->new("2");
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
