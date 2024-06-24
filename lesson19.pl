use strict;
use warnings;
use Data::Dumper;
$| = 1;

# TEST YOUR KNOWLEDGE
# General task: parse test3.csv file, and clean up the data

# TASK 1: Wite a Perl program, that reads this file 'test3.csv' line by line and outputs each line
sub task1 {
    my $data_file = 'test3.csv';

    unless (open(INPUT, $data_file)) {
        die 'Cannot open a file: ' . $data_file . "\n";
    }
    <INPUT>;

    # Demonstrating two ways of readning a file line by line,
    # 1. Using a while loop
    # 2. Using an foreach loop

    my @lines;
    while (my $line = <INPUT>) {
        chomp($line); # remove the newline character
        push(@lines, $line);
        
        print($line . "\n");
    }

    print('---' . "\n");

    foreach my $line(@lines) {
        print($line . "\n");
    }
    close INPUT;
}

# TASK 2: 
# + Skip the headline,
# + Skip blank lines in the file,
# + Get each line from the file into a variable (name, payment, date) that corresponds to a particular field,
# + Clean up the space on each side of the comma.
# + Skip the lines that don't have every field.
sub task2 {
    my $data_file = 'test3.csv';

    unless (open(INPUT, $data_file)) {
        die 'Cannot open a file: ' . $data_file . "\n";
    }
    <INPUT>; # skip the headline

    my @lines = <INPUT>; # read all lines into an array

    LINE: foreach my $line (@lines) {
        chomp($line); # remove the newline character

        my @one_line = split(/,/, $line); # split the line by comma

        if (@one_line < 3) { # if the line has less than 3 elements, skip it
            next LINE;
        }
        
        foreach my $field(@one_line) {
            if (length($field) == 0) { # if the field is empty, skip it
                next LINE;
            }
            $field =~ s/^\s*|\s*$//g; # remove spaces on each side of the line
        }
        
        my ($name, $payment, $date) = @one_line; # assign each element to a variable
        
        print("'$name'", "'$payment'", "'$date'" ."\n");
    }
    close INPUT;
}

# TASK 3:
# + Write signle regular expression that can clean each line, by getting rid of a dolar sign, approx. space, and question marks.
# + Store this array in the array of hashes, and iterate through this array of hashes and add up the payments for each value in array of hashes.
sub task3 {
    my $data_file = 'test3.csv';

    unless (open(INPUT, $data_file)) {
        die 'Cannot open a file: ' . $data_file . "\n";
    }
    <INPUT>;
    my @lines = <INPUT>;

    my @data; # array of hashes
    LINE: foreach my $line (@lines) {
        chomp($line);
        my @one_line = split(/,/, $line);

        if (@one_line < 3) {
            next LINE;
        }
        
        foreach my $field(@one_line) {
            if (length($field) == 0) {
                next LINE;
            }
            $field =~ s/^\s*|\s*$|\$|\?|approx\.\s*//g; # added a regular expression to remove $, ?, and approx. space
        }
        
        my ($name, $payment, $date) = @one_line;

        my %values = ( # hash
            'Name' => $name,
            'Payment' => $payment,
            'Date' => $date,
        );

        push @data, \%values; # push the hash into the array
        print("'$name'", "'$payment'", "'$date'" ."\n");
    }
    close INPUT; # close the file

    my $sum = 0;
    foreach my $field(@data) { # iterate through the array of hashes
        $sum += $field->{'Payment'}; # add up the payments
    }
    print sprintf("%.2f\n", $sum); # print the sum
    
}

# TASK 4:
# - Figure out how you can use acctual headings from the file as the keys in the hash, get rid of name, payment, and date.
sub task4 {
    my $data_file = 'test3.csv';

    unless (open(INPUT, $data_file)) {
        die 'Cannot open a file: ' . $data_file . "\n";
    }

    my $headings = <INPUT>; # read the first line
    chomp($headings); # remove the newline character
    my @headings = split(/\s*,\s*/, $headings); # split the line by comma

    my @lines = <INPUT>; # read all lines into an array

    my @data; # array of hashes
    LINE: foreach my $line (@lines) {
        chomp($line);
        my @one_line = split(/,/, $line);

        if (@one_line < 3) {
            next LINE;
        }
        
        foreach my $field(@one_line) {
            if (length($field) == 0) {
                next LINE;
            }
            $field =~ s/^\s*|\s*$|\$|\?|approx\.\s*//g;
        }

        my %values; # hash
        for (my $i=0; $i < @headings; $i++) {
            my $heading_name = $headings[$i]; # get the heading name
            my $single_value = $one_line[$i]; # get the value
            
            $values{$heading_name} = $single_value; # assign the value to the hash
        }

        push @data, \%values; # push the hash into the array
    }
    close INPUT; # close the file

    my $sum = 0;
    foreach my $field(@data) { # iterate through the array of hashes
        print($field->{'Name'} . ' ' . $field->{'Payment'} . ' ' . $field->{'Date'} . "\n");
        $sum += $field->{'Payment'}; # add up the payments
    }
    print sprintf("%.2f\n", $sum); # print the sum
}

sub main {
    # task1();
    # task2();
    # task3();
    task4();
}

main();
