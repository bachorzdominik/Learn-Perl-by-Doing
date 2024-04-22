# (1.2) Arrays & Files: Arrays and Checking Files
use strict;
use warnings;

$|=1;

sub main {
    my @files = ('files/image.jpg', 'lesson1.pl', 'lesson2.pl', 'files/missing-file.txt');

    foreach my $file(@files) {
        if(-f $file) {
            print "File exists $file\n";
        }
        else {
            print "File does not exist: $file\n";
        }
    }

}

main();
