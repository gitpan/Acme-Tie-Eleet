#!perl
#

use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new (
    module_name         => 'Acme::Tie::Eleet',
    dist_author         => 'Jerome Quelin <jquelin@cpan.org>',
    license             => 'gpl',
    dist_version_from   => 'lib/Acme/Tie/Eleet.pm',
    add_to_cleanup => [ 'Acme-Tie-Eleet-*',
                        map { ( '*/' x $_ ) . '*~' } 0..4 ],
    script_files   => [ ],
    build_requires => { },
    requires       => { },
);

$builder->create_build_script();
