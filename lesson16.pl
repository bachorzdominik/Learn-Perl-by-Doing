# (2.3.1) : Storing CSV in an Array of Hashes

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

    my @data;

    while(my $line = <INPUT>) {
        chomp $line;
        my ($name, $playment, $date) = split /\s*,\s*/, $line;

        my %values = (
            "Name" => $name,
            "Price" => $playment,
            "Date" => $date
        );

        push @data, \%values;
    }

    close INPUT;
    
    foreach my $data(@data) {
        print($data->{'Name'} . "\n");
    }
    print("\n");

    print($data[1]{'Name'} . "\n");
}

main();
