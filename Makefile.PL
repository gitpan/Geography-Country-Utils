# $File: //member/autrijus/Geography-Country-Utils/Makefile.PL $ $Author: autrijus $
# $Revision: #1 $ $Change: 4087 $ $DateTime: 2003/02/05 04:03:47 $

use ExtUtils::MakeMaker;

WriteMakefile(
    AUTHOR		=> 'Autrijus Tang (autrijus@autrijus.org)',
    ABSTRACT		=> 'Utilities for country-specific information',
    NAME		=> 'Geography::Country::Utils',
    VERSION_FROM	=> 'lib/Geography/Country/Utils.pm',
    DISTNAME		=> 'Geography-Country-Utils',
    BINARY_LOCATION	=> 'x86/Geography-Country-Utils.tar.gz',
    PREREQ_PM		=> {
	'Time::Local'	=> 0,
	'Net::Country'	=> 0,
    },
);

1;
