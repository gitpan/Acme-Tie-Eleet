#-*-perl-*-
# $Id: basic.t,v 1.2 2002/02/01 15:50:09 jquelin Exp $
#

#-----------------------------------#
#          Initialization.          #
#-----------------------------------#

# Modules we rely on.
use Test;
use POSIX qw(tmpnam);

BEGIN { plan tests => 2 };

# Vars.
my $file = tmpnam();


#--------------------------------#
#          Basic tests.          #
#--------------------------------#

# Loading the module.
eval { require Acme::Tie::Eleet; };
ok($@, "");


# Simple tie.
eval {
    open OUT, ">$file" or die "Unable to create temporary file: $!";
    tie *OUT, 'Acme::Tie::Eleet', *OUT;
    untie *OUT;
};
ok($@, "");

unlink $file;
