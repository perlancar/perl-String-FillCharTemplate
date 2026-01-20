package String::FillCharTemplate;

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);

# AUTHORITY
# DATE
# DIST
# VERSION

our @EXPORT_OK = qw(
                       fill_char_template
               );

sub fill_char_template {
    my ($template, $str) = @_;

    my $len = length($str);
    my $i = 0;
    $template =~ s/#/$i >= $len ? " " : substr($str, $i++, 1)/eg;
    $template;
}

1;
# ABSTRACT: Fill placeholders in a template with characters from a string

=head1 SYNOPSIS

 use String::FillCharTemplate qw/fill_char_template/;

 my $res;
 $res = fill_char_template("###-###-###", "1234567890"); # => "123-456-789"
 $res = fill_char_template("###-###-###", "aaabbbc"); # => "aaa-bbb-c  "


=head1 FUNCTIONS

=head2 fill_char_template

Usage:

 my $result = fill_char_template($template, $str);

=head1 SEE ALSO

=head2 perl format

L<perlform>.

Perl format has a "fill mode" to let you fill multiple fields from a single
scalar. It is more flexible but also has additional syntax. Example:

 format STDOUT =
 ^<<-^<<-^<<
 $s, $s, $s
 .

 $s = "1234567890";
 write;

=cut
