# (1.2) Arrays & Files: Writing Files and Replacing Text
use strict;
use warnings;

$|=1;

sub main {
    my $input = 'files/mymanjeeves.txt';
    my $output = 'files/output.txt';

    open(INPUT, $input) or die "File not found $input\n";
    open(OUTPUT, '>'.$output) or die "Can't create $output\n";
    
    while(my $line = <INPUT>) {
        if ($line =~ /\begg\b/) {
            $line =~ s/you/YOU/ig;
            print OUTPUT "$line";
        }
    }

    close(INPUT);
    close(OUTPUT);
}

main();
