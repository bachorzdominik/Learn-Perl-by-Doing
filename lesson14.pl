# (2.2.4) : Iterating over a Hashes

use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main {

    # defining an array of variables
    my ($one, $two, $three) = (1, 2, 3);
    print "The value of \$two is $two\n\n";

    my %animal_foods = (
        'cats' => 'cheese',
        'dogs' => 'meat',
        'birds' => 'sunflower seeds',
    );

    while (my ($key, $value) = each %animal_foods) {
        print "$key: $value\n";
    }
    print("\n");

    my @animals = keys %animal_foods;
    my @foods = values %animal_foods;

    print Dumper(@animals) . "\n";
    print Dumper(@foods) . "\n";

    for my $key(@animals) {
        my $value = $animal_foods{$key};
        print("$key: $value\n");
    }


}

main();
