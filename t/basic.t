#-*-perl-*-
# $Id: basic.t,v 1.1.1.1 2003/06/12 17:17:41 jquelin Exp $
#
# Basic tests.
#

#-----------------------------------#
#          Initialization.          #
#-----------------------------------#

# Modules we rely on.
use Test;
use POSIX qw(tmpnam);

BEGIN { plan tests => 3 };

# Vars.
my $file = tmpnam();


#--------------------------------#
#          Basic tests.          #
#--------------------------------#

# Loading the module.
eval { require Acme::Tie::Eleet; };
ok($@, "");


# Simple tiehandle.
eval {
    open OUT, ">$file" or die "Unable to create temporary file: $!";
    tie *OUT, 'Acme::Tie::Eleet', *OUT;
    untie *OUT;
};
ok($@, "");


# Simple tiescalar.
eval {
    my $scalar;
    tie $scalar, 'Acme::Tie::Eleet';
    untie $scalar;
};
ok($@, "");


unlink $file;
