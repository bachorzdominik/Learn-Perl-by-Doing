# (2.3.3) : Cleaning CSV Data

use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main {
    my $input = 'test3.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }
    <INPUT>;

    my @data;

    LINE: while(my $line = <INPUT>) {

        # fix spaces at the begining of the line in the csv file
        # $line =~ s/^\s*//;
        # fix spaces at the end of the line in the csv file
        # $line =~ s/\s*$//;

        # fix spaces at the begining and end of the line in the csv file
        # in one line, using the pipe character
        # /g is a global flag - as many times as nessessary
        $line =~ s/^\s*|\s*$//g;
        $line =~ s/\?|approx\.|\$//g;

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
        print($data->{'Name'}, " ", $data->{'Price'}, " ", $data->{'Date'} . "\n");
    }
    print("*********\n");

    print("Descartes: $data[3]{'Name'}; Date: '$data[3]{'Date'}'\n");
}

main();
