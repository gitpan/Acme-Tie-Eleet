#!perl
#
# This file is part of Acme::Tie::Eleet.
# Copyright (c) 2001-2007 Jerome Quelin, all rights reserved.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#
#

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
