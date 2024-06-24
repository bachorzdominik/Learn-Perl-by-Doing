# (2.3.2) : Validating CSV Data

use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main {
    my $input = 'test2.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }
    <INPUT>;

    my @data;

    LINE: while(my $line = <INPUT>) {
        $line =~ /\S+/ or next;

        chomp $line;

        my @values = split /\s*,\s*/, $line;

        if (scalar(@values) < 3) {
            print "Invalid line $line\n";
            next LINE;
        }

        foreach my $value(@values) {
            if ($value eq '') {
                print "Invalid line $line\n";
                next LINE;
            }
        }

        my ($name, $playment, $date) = @values;

        my %values = (
            "Name" => $name,
            "Price" => $playment,
            "Date" => $date
        );

        push @data, \%values;
    }

    close INPUT;

    print("--------\n");
    foreach my $data(@data) {
        print($data->{'Name'} . "\n");
    }
    print("--------\n");

    print($data[1]{'Name'} . "\n");
}

main();
