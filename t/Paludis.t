use Test::More tests => 4;
BEGIN { use_ok('Paludis') };

{
    like PALUDIS_VERSION_MAJOR, qr/^\d+$/;
    like PALUDIS_VERSION_MINOR, qr/^\d+$/;
    like PALUDIS_VERSION_MICRO, qr/^\d+$/;
}
