use Test::More tests => 4;
BEGIN { use_ok('Paludis') };

{
    ok my $paludis = Paludis->new();
    is $paludis->MAJOR_VERSION, 0;
    is $paludis->MINOR_VERSION, 27;
}
