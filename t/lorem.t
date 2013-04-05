use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
use Test::FailWarnings;

use Data::Faker;

my $object = Data::Faker->new;

my @cases = ( [qw/words 1/], [qw/words 2/], [qw/sentences 3/], [qw/paragraphs 4/], );

my %splitter = (
    words      => qr/\s+/,
    sentences  => qr/\./,
    paragraphs => qr/\n\n/,
);

for my $c (@cases) {
    my ( $method, $count ) = @$c;
    my $string = $object->$method($count);
    my @parts = split $splitter{$method}, $string;
    is( scalar @parts, $count, "$method($count) count correct" ) or diag explain \@parts;
}

done_testing;
# COPYRIGHT
# vim: ts=4 sts=4 sw=4 et:
