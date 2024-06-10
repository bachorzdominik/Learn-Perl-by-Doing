# (2.2.5) : Arrays of Hashes

use strict;
use warnings;
use Data::Dumper;

$|=1;

sub main {

    my %animal_foods = (
        'cats' => 'milk',
        'mouse' => 'cheese',
        'dogs' => 'meat',
        'birds' => 'sunflower seeds',
    );

    my %people_foods = (
        'john' => 'pizza',
        'jane' => 'ice cream',
        'susan' => 'salad',
        'billy' => 'burgers',
    );

    my @foods;

    push @foods, \%animal_foods;
    push @foods, \%people_foods;

    
    print(Dumper(@foods));

    print("\n");
    print($foods[0]{'dogs'} . "\n");
    print($foods[1]{'john'} . "\n");
    print("\n");

    # Demostarting two ways to iterate over the array of hashes

    # %$var dereferences the hash
    # This loop uses the 'each' function to iterate over the keys 
    # and values of each hash
    foreach my $var(@foods) {
        while(my ($key, $value) = each %$var) {
            print("$key: $value\n");
        }
    }
    print("\n");
    
    # %$var dereferences the hash
    # This loop uses the 'keys' function to get all the keys of each hash, 
    # and then accesses each value with the hash key
    foreach my $var(@foods) {
        foreach my $key (keys %$var) {
            my $value = $var->{$key};
            
            print("$key: $value" . "\n");
        }
    }

}

main();
