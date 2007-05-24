#!perl
#

use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Acme::Tie::Eleet',
    AUTHOR              => 'Jerome Quelin <jquelin@cpan.org>',
    VERSION_FROM        => 'lib/Acme/Tie/Eleet.pm',
    ABSTRACT_FROM       => 'lib/Acme/Tie/Eleet.pm',
    PREREQ_PM => {},
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => [
                'Acme-Tie-Eleet-*',
                map { ( '*/' x $_ ) . '*~' } 0..4
                ] },
);
