# (2.2.2) : Arrays of Arrays : part2

use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main {
    my $input = 'test.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }
    <INPUT>;

    my @lines;

    while(my $line = <INPUT>) {
        chomp $line;
        my @values = split /\s*,\s*/, $line;

        # array reference
        push @lines, \@values;
    }
    
    foreach my $line(@lines) {
        # print Dumper($line)
        # dereference the array reference
        print("Name: " . $line->[0] . "\n");
        print("Price: " . $line->[1] . "\n");
        print("Date: " . $line->[2] . "\n");
        print("\n");
    }
    
    close INPUT;
}

main();
