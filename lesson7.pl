use strict;
use warnings;
$|=1;

# TEST YOUR KNOWLEDGE

# TASK 1: 
# + Create a hello world program in Perl, with the following requirements:
# + Force the programmer to declare varialbes,
# + Turn on verbose error warnings,
# + Clear defined entry points.

sub task1 {
    my $hello = "Hello World!";
    print("$hello\n");
}

# TASK 2: 
# + Create the array of made up addresses, and some of them should be valid and some invalid.
# + Loop through the array and print out the valid addresses.
# + Valid are:
#   + At least one alphanumeric character 
#   + followed by an @ sign, 
#   + followed by at least one more alphanumeric character, 
#   + followed by a dot, 
#   + followed by at least one more alphanumeric character.
#   + So three alphanumeric characters, and you got an @ sign and a dot kind of sandwiched in between them all.

sub task2 {
    my @emails = (
        'john@caveofprogramming.com',
        'hello',
        '@llkj.com',
        'jklj778dd@somewhere77.com',
        'lkj1@7788.',
    );

    for my $email(@emails) {
        if ($email =~ /\w+\@\w+\.\w+/) {
            print("Valid: $email\n");
        }
        else {
            print("Invalid: $email\n");
        
        }
    }
}

# TASK 3:
# + Declare a variable called $text and assign it the value of "The code for this device is GP8765."
# + Write a regular expression that will match the code in the text and print it out.
# + Extract: Two capital letters followed by four digits.
# + Display the code or print not found.

sub task3 {
    my $text = "The code for this device is GP8765.";
    if ($text =~ /([A-Z]{2}\d{4})/) {
        print("Code: $1\n");
    } else {
        print("Code not found\n");
    }
}

# TASK 4: 
# + Match all of the string after "is" and a space -> all the way up to the first dot that you encounter.
# + So, you want to match everything from just after the space which follows "is" all the way up to the dot.
# + And you want to match as little as possible, stuff in between can be anything, but must be at lest one character there.

sub task4 {
    my $text = "The code for this device is GP8765.";
    if ($text =~ /\sis\s(.+?)\./) {
        print("Found: $1\n");
    } else {
        print("Not found\n");
    }
}

# TASK 5:
# + Define the code you're looking for as two alphanumeric characters followed by a minimum of two and max 6 digits,
# + after two alphanumeric characters, and keep eveything else the same.

sub task5 {
    my $text = "The code for this device is GP8765.";
    if ($text =~ /\sis\s([\w]{2}\d{2,6})\./) {
        print("Code: $1\n");
    } else {
        print("Code not found\n");
    }
}


sub main {
    print("-------------------\n");
    print("Task1: \n");
    print("\n");
    task1();
    
    print("-------------------\n");
    print("Task2: \n");
    print("\n");
    task2();

    print("-------------------\n");
    print("Task3: \n");
    print("\n");
    task3();

    print("-------------------\n");
    print("Task4: \n");
    print("\n");
    task4();

    print("-------------------\n");
    print("Task5: \n");
    print("\n");
    task5();
}

main();
