#-*-perl-*-
# $Id: quotes.t,v 1.3 2002/02/01 15:50:36 jquelin Exp $
#

#-----------------------------------#
#          Initialization.          #
#-----------------------------------#

# Modules we rely on.
use Test;
use POSIX qw(tmpnam);

# Initialization.
BEGIN { plan tests => 2 };

# Our stuff.
require Acme::Tie::Eleet;
untie *STDIN;
untie *STDOUT;
untie *STDERR;

# Vars.
my $file = tmpnam();
my $line;
my @opts = 
    ( letters    => 0,
      spacer     => 0,
      case_mixer => 0,
      words      => 0,
      add_before => 0,
      add_after  => 0,
      extra_sent => 0
);


#----------------------------------#
#          Adding quotes.          #
#----------------------------------#

# Beginning of sentence.
open OUT, ">$file" or die "Unable to create temporary file: $!";
tie *OUT, 'Acme::Tie::Eleet', *OUT, @opts, add_before=>100;
print OUT "eleet";
untie *OUT;
open IN, "<$file" or die "Unable to open temporary file: $!";
$line = <IN>;
ok($line, qr/^(?!eleet)/);

# End of sentence.
open OUT, ">$file" or die "Unable to create temporary file: $!";
tie *OUT, 'Acme::Tie::Eleet', *OUT, @opts, add_after=>100;
print OUT "eleet";
untie *OUT;
open IN, "<$file" or die "Unable to open temporary file: $!";
$line = <IN>;
ok($line, qr/(?!eleet$)/);

unlink $file;
