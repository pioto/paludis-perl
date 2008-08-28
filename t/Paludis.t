use Test::More tests => 4;
BEGIN { use_ok('Paludis') };

{
    like PALUDIS_VERSION_MAJOR, qr/^\d+$/, 'PALUDIS_VERSION_MAJOR is sane';
    like PALUDIS_VERSION_MINOR, qr/^\d+$/, 'PALUDIS_VERSION_MINOR is sane';
    like PALUDIS_VERSION_MICRO, qr/^\d+$/, 'PALUDIS_VERSION_MICRO is sane';
}
