# (2.1) : Reading Files: Split and Reading CSV Files.
# unless - execute the code only if the condition is false.

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

    while(my $line = <INPUT>) {
        chomp $line;

        my @line = split /\s*,\s*/, $line;        
        # print($line[1] . "\n");
        print(Dumper(@line));
    }
    
    close INPUT;
}

main();
