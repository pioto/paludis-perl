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
    LIBS              => [split / /, `pkg-config --libs-only-l paludis`],
    DEFINE            => '',
    CC                => $CC,
    CCFLAGS           => `pkg-config --cflags-only-other paludis`,
    LD                => '$(CC)',
    INC               => "-I. $paludis_include_dir",
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
    XSOPT             => '-C++',
    TYPEMAPS          => ['perlobject.map'],
    clean             => {FILES => "const-*.inc"}
);

if  (eval {require ExtUtils::Constant; 1}) {
  # If you edit these definitions to change the constants used by this module,
  # you will need to use the generated const-c.inc and const-xs.inc
  # files to replace their "fallback" counterparts before distributing your
  # changes.
  my @names = (qw(PALUDIS_VERSION_MAJOR PALUDIS_VERSION_MINOR 
      PALUDIS_VERSION_MICRO));
  ExtUtils::Constant::WriteConstants(
                                     NAME         => 'Paludis',
                                     NAMES        => \@names,
                                     DEFAULT_TYPE => 'IV',
                                     C_FILE       => 'const-c.inc',
                                     XS_FILE      => 'const-xs.inc',
                                  );     

}
else {
  use File::Copy;
  use File::Spec;
  foreach my $file ('const-c.inc', 'const-xs.inc') {
    my $fallback = File::Spec->catfile('fallback', $file);
    copy ($fallback, $file) or die "Can't copy $fallback to $file: $!";
  }
}

