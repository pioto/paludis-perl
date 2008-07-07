use Test::More tests => 4;
BEGIN { use_ok('Paludis') };

{
    is Paludis::PALUDIS_VERSION_MAJOR, 0;
    is Paludis::PALUDIS_VERSION_MINOR, 27;
    is Paludis::PALUDIS_VERSION_MICRO, 0;
}
