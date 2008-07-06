use 5.008008;
use ExtUtils::MakeMaker;

$CC = 'g++';

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
my $paludis_include_dir = `pkg-config --cflags-only-I paludis`;
WriteMakefile(
    NAME              => 'Paludis',
    VERSION_FROM      => 'lib/Paludis.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Paludis.pm', # retrieve abstract from module
       AUTHOR         => 'Mike Kelly <pioto@pioto.org>') : ()),
    LIBS              => ['-lpaludis', '-lpaludisutil', '-lpaludisargs'],
    DEFINE            => '',
    CC                => $CC,
    CCFLAGS           => `pkg-config --cflags-only-other paludis`,
    LD                => '$(CC)',
    INC               => "-I. $paludis_include_dir",
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
    XSOPT             => '-C++',
    TYPEMAPS          => ['perlobject.map'],
);
