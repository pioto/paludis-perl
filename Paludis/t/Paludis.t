use Test::More tests => 4;
BEGIN { use_ok('Paludis') };

{
    is PALUDIS_VERSION_MAJOR, 0;
    is PALUDIS_VERSION_MINOR, 27;
    is PALUDIS_VERSION_MICRO, 0;
}
