use 5.008001;
use strict;
use warnings;
use Test::More 0.96;
use Test::FailWarnings;

use Data::Faker;

my $object = Data::Faker->new;

ok( my $word = $object->words, "Got a word" );
is( my @quux = split( /\s+/, $word ), 1, "There was 1 word" );
ok( my $words = $object->words(3), "Got some words" );
is( my @foo = split( /\s+/, $words ), 3, "There were 3 words" );
ok( my $sentences = $object->sentences(3), "Got some sentences" );
is( my @bar = split( /\./, $sentences ), 3, "There were 3 sentences" );
ok( my $paragraphs = $object->paragraphs(4), "Got some paragraphs" );
is( my @baz = split( /\n\n/, $paragraphs ), 4, "There were 4 paragraphs" );

done_testing;
# COPYRIGHT
# vim: ts=4 sts=4 sw=4 et:
