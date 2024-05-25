# (1.3) Regular Expressions:
# The Regex Wildcard . -> any character except newline, to match new line use modifier s,
# Groups () -> grouping characters,
# Quantifiers - Greedy and Non Greedy,

# '+' one or more of the preceding character, as many as possible (greedy),
# '*' zero or more of the preceding character as many as possible (greedy),
# '*?' zero or more of the preceding character as few as possible (non-greedy),
# '+?' one or more of the preceding character as few as possible (non-greedy),

# .* is gredy; so it maches zero or more characters, as many as possible,
# *? is non-greedy; so it matches zero or more, as few as possible,
# Escape Sequences: \d -> digit, \w -> word character, \s -> whitespace, \b -> word boundary, \S -> non-whitespace,
# ? Numeric Quantifiers: \d{3} -> exactly 3 digits, \d{3,} -> 3 or more digits, \d{3,5} -> 3 to 5 digits,
# escape character: \ -> to escape special characters like $, etc.

use strict;
use warnings;

$|=1;

sub main {
    my $book = 'files/mymanjeeves.txt';
    open(INPUT, $book) or die "File not found $book\n";
    
    while(my $line = <INPUT>) {
        if ($line =~ /(s.*?n)/) {
            print "$1\n";
        }
    }

    close(INPUT);

    print("-------------------\n");

    my $text = 'I am 117 years old tomorrow.';
    my $text2 = 'Iam117yearsold_tomorrow.';

    if ($text =~ /(am\s\d+)/) {
        print "Matched: '$1'\n";
    }
    if ($text =~ /(y\S*)/) {
        print "Matched: '$1'\n";
    }
    if ($text2 =~ /(\w*)/) {
        print "Matched: '$1'\n";
    }

}

main();
