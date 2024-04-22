# (1.2) Arrays & Files: Reading Files and Beginning of Regular Expressions
use strict;
use warnings;
use HTTP::Tiny;
use IO::File;

$|=1;

sub main {
    my $book = 'files/mymanjeeves.txt';
    if (! -f $book) {
        print "Downloading the book from Project Gutenberg... \n";
        my $response = HTTP::Tiny->new->get('https://www.gutenberg.org/cache/epub/8164/pg8164.txt');
        if ($response->{success}) {
            my $fh = IO::File->new($book, ">");
            $fh->print($response->{content});
            $fh->close;
        } else {
            die "Failed to get file: $response->{status} $response->{reasons}";
        }
    }
    open(INPUT, $book) or die "File not found $book\n";
    
    while(my $line = <INPUT>) {
        if ($line =~ / egg /) {
            print "$line";
        }
    }

    close(INPUT);

}

main();
