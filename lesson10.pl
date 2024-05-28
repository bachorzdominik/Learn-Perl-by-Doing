# (2.2.2) : Arrays of Arrays : part1

use strict;
use warnings;
use Data::Dumper;

$|=1;

my @animals = ('dog', 'cat', 'rabbit', 'mouse');
my @fruits = ('apple', 'banana', 'orange');

my @values;

# scaler value telling us where to find the array of values it's not the array itself,
# array of arrays -> we actual have array of references to another arrays,
push @values, \@animals;
push @values, \@fruits;

print Dumper(@values);
