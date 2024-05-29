# (2.2.3) : Hashes

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

    my @months = keys %months;

    foreach my $month(@months) {
        my $value = $months{$month};
        print "$month: $value\n";
    }

    while(my ($key, $value) = each %days) {
        print "$key: $value\n";
    }
}

main();
