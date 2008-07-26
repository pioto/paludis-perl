use 5.008008;
use ExtUtils::MakeMaker;

$CC = 'g++';

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my $paludis_include_dir = `pkg-config --cflags-only-I paludis`;
WriteMakefile(
    NAME              => 'Paludis::VersionSpec',
    VERSION_FROM      => 'lib/Paludis/VersionSpec.pm',
    PREREQ_PM         => {},
    ABSTRACT_FROM     => 'lib/Paludis/VersionSpec.pm',
    AUTHOR            => 'Mike Kelly <pioto@pioto.org>',
    LIBS              => [split / /, `pkg-config --libs-only-l paludis`],
    DEFINE            => '',
    CC                => $CC,
    CCFLAGS           => `pkg-config --cflags-only-other paludis`,
    LD                => '$(CC)',
    INC               => "-I. -I.. $paludis_include_dir",
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
    XSOPT             => '-C++',
    TYPEMAPS          => ['../perlobject.map'],
);
