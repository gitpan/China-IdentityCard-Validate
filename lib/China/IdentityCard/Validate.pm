package China::IdentityCard::Validate;

use strict;
use vars qw($VERSION @ISA @EXPORT);
use Exporter;
$VERSION = '0.01';
@ISA = qw(Exporter);
@EXPORT = qw(validate_id);

sub validate_id {
	my $id = shift;
	$id =~ /^\d{17}(\d|x)$/i or return 0;
	
	my @gene = (7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
	my @v_code = ('1','0','X','9','8','7','6','5','4','3','2');
	
	my @id = split(//, $id);
	my $v_mun = pop(@id);
	
	my $sum;
	foreach (0 .. 16) {
		$sum += $id[$_] * $gene[$_];
	}
	my $s_mod_ed = $sum % 11;
	if ($v_mun =~ /^$v_code[$s_mod_ed]$/i) { # for special X
		return 1;
	} else {
		return 0;
	}
}

1;
__END__

=head1 NAME

China::IdentityCard::Validate -  Validate the Identity Card no. in China

=head1 SYNOPSIS

  use China::IdentityCard::Validate;
  
  my $id = '11010519491231002X'; # a unsure identity card no.
  
  if (validate_id($id)) { # call the validate_id method
    print 'Pass';
  } else {
    print 'failed, maybe faked.';
  }

=head1 DESCRIPTION

There is a Chinese document @ L<http://www.1313s.com/f/IDCardValidate.html>. It explain the algorithm of how-to validate the Identity Card no.

=head1 RESTRICTIONS

*Only* 18-length id card no. is available. The old 15-length no. is under construction. 

=head1 RETURN VALUE

if it's right, return 1. otherwise, return 0/

=head1 BUGS

feel free to report any bugs or corrections.

=head1 AUTHOR

Fayland <fayland@gmail.com>

= COPYRIGHT

Copyright (c) 2005. Fayland. All rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See http://www.perl.com/perl/misc/Artistic.html

=cut