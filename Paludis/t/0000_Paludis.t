use Test::More tests => 5;
BEGIN { use_ok('Paludis') };

{
    ok my $paludis = Paludis->new();
    isa_ok $paludis, 'Paludis';
    is $paludis->MAJOR_VERSION, 0;
    is $paludis->MINOR_VERSION, 27;
}
