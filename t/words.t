#-*-perl-*-
# $Id: words.t,v 1.3 2002/02/01 15:50:26 jquelin Exp $
#

#-----------------------------------#
#          Initialization.          #
#-----------------------------------#

# Modules we rely on.
use Test;
use POSIX qw(tmpnam);

# Initialization.
BEGIN { plan tests => 3 };

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


#--------------------------------------#
#          Words replacement.          #
#--------------------------------------#

# No replacement.
open OUT, ">$file" or die "Unable to create temporary file: $!";
tie *OUT, 'Acme::Tie::Eleet', *OUT, @opts, words=>0;
print OUT "sthg";
untie *OUT;
open IN, "<$file" or die "Unable to open temporary file: $!";
$line = <IN>;
ok($line, qr/^sthg/);

# Word replacement.
open OUT, ">$file" or die "Unable to create temporary file: $!";
tie *OUT, 'Acme::Tie::Eleet', *OUT, @opts, words=>1;
print OUT "hacker";
untie *OUT;
open IN, "<$file" or die "Unable to open temporary file: $!";
$line = <IN>;
ok($line, qr/^haxor/);

# Word replacement with an anonymous array.
open OUT, ">$file" or die "Unable to create temporary file: $!";
tie *OUT, 'Acme::Tie::Eleet', *OUT, @opts, words=>1;
print OUT "cool";
untie *OUT;
open IN, "<$file" or die "Unable to open temporary file: $!";
$line = <IN>;
ok($line, qr/^(kewl|kool)/);

unlink $file;
