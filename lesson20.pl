# (2.5.1) : 2Web Scraping
use strict;
use warnings;
use LWP::UserAgent;
use Data::Dumper;

$| = 1;

sub fetch_content {
    my ($url) = @_; # ¯\_(ツ)_/¯
    
    my $ua = LWP::UserAgent->new();
    $ua->agent('Mozilla/5.0');

    my $response = $ua->get($url);

    unless ($response->is_success) {
        die "Can't get url\n";
    }

    return $response->decoded_content;
}

sub extract_pattern {
    my ($content, $patterns) = @_;

    my %results;

    foreach my $label (keys %$patterns) {
        my $pattern = $patterns->{$label};

        my %seen;
        while ($content =~ m/$pattern/g) {
            my $match = $1;
            next if $seen{$match}++; # move to next iteration if we've seen this match before
            push @{$results{$label}}, $match;
        }
    }

    return %results;
}

sub print_results {
    my (%results) = @_;

    if (exists $results{'title'}) {
        print "Title: $results{'title'}[0]\n";
    }

    if (exists $results{'course_title'}) {
        print "Courses:\n";
        foreach my $course (@{$results{'course_title'}}) {
            print " - $course\n";
        }
    }
}

sub main {
    my $url = 'https://caveofprogramming.teachable.com';

    my %patterns = (
        'title' => '<title>(.*?)<\/title>',
        'course_title' => '<div class="course-listing-title" role="heading" aria-level="2" title=".*?">\s*(.*?)\s*<\/div>'
    );

    my $content = fetch_content($url);
    
    my %results = extract_pattern($content, \%patterns);

    print_results(%results);
}

main();
