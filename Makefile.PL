use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Geography::Country::Utils',
    'VERSION_FROM' => 'lib/Geography/Country/FIPS.pm', # finds $VERSION
);
