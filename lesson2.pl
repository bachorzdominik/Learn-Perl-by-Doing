# (1.1) Getting Started: Downloading Text and Images
use strict;
use warnings;

use LWP::Simple; # Library for downloading content from the web, using http only...

sub main {
    print "Downloading ...\n";
    my $content =  get("http://google.pl");
    if (defined $content) {
        # print $content;
        print "Content downloaded\n"
    }
    else {
        print "Failed to download the content\n";
    }
    getstore("http://google.pl", "files/google.html");
    
    my $code = getstore("http://process.fs.teachablecdn.com/ADNupMnWyR7kCWRvm76Laz/resize=width:705/https://www.filepicker.io/api/file/PWXyGcRwSVKZNUeE4iwh", 
    "files/image.jpg");

    if ($code == 200) {
        print "Image downloaded\n";
    }
    else {
        print "Failed to download the image\n";
    }

    print "Finished\n";
}

main();
