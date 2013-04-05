use 5.008001;
use strict;
use warnings;

package Data::Faker::Lorem;
# ABSTRACT: Data::Faker plugin for random Latin-looking text
# VERSION

use base 'Data::Faker';
 
my $lorem;
sub _lorem {
    require Text::Lorem;
    $lorem = Text::Lorem->new;
}

__PACKAGE__->register_plugin(
    words => sub {
        my ($self, $n) = @_;
        _lorem->words($n || 1);
    },
    sentences => sub {
        my ($self, $n) = @_;
        _lorem->sentences($n || 1);
    },
    paragraphs => sub {
        my ($self, $n) = @_;
        _lorem->paragraphs($n || 1);
    },
);

1;

=for Pod::Coverage method_names_here

=head1 SYNOPSIS

    use 5.010;
    use Data::Faker;
    
    my $faker = Data::Faker->new();
    
    say $faker->words(2);
    say $faker->sentences(4);
    say $faker->paragraphs(1);

=head1 DESCRIPTION

This module wraps L<Text::Lorem> and makes its methods available via
L<Data::Faker> so you don't have to create another singleton.

=cut

# vim: ts=4 sts=4 sw=4 et:
