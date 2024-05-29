# (2.2.3) : Hashes : Playing around with hashes

use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main {

    # hashes has no order
    my %months = (
        'Jan' => 1,
        'Feb' => 2,
        'Mar' => 3,
        'Apr' => 4,
        'May' => 5,
        'Jun' => 6,
        'Jul' => 7,
        'Aug' => 8,
        'Sep' => 9,
        'Oct' => 10,
        'Nov' => 11,
        'Dec' => 12
    );

    my @month_order = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);

    print $months{'Jan'} . "\n";

    my %days = (
        1 => 'Monday',
        2 => 'Tuesday',
        3 => 'Wednesday',
        4 => 'Thursday',
        5 => 'Friday',
        6 => 'Saturday',
        7 => 'Sunday'
    );

    print $days{1} . "\n";
    print("\n");

    # this print is not in order
    my @months = keys %months;

    foreach my $month(@months) {
        my $value = $months{$month};
        print "$month: $value\n";
    }
    print("\n");

    # this print is in order, we're using the array @month_order to order the print
    foreach my $month(@month_order) {
        my $value = $months{$month};
        print "$month: $value\n";
    }
    print("\n");

    # this print is not in order
    while(my ($key, $value) = each %days) {
        print "$key: $value\n";
    }
    print("\n");

    # this print is in order, we're using the range operator to order the print
    for my $day_number(1..7) {
        print "$day_number: $days{$day_number}\n";
    }
}

main();
