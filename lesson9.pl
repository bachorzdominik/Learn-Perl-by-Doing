# (2.2) : The Push function

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
    # my $count = 0;

    while(my $line = <INPUT>) {

        chomp $line;

        my @line = split /\s*,\s*/, $line;        
        # print($line[1] . "\n");
        # print(Dumper(@line));

        # $lines[$count] = $line;
        # $count++;
        push @lines, $line;
    }
    
    foreach my $line(@lines) {
        print($line . "\n")
    }
    
    close INPUT;
}

main();
