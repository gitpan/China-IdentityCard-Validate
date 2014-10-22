# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl China-IdentityCard-Validate.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test::More tests => 3;
BEGIN { use_ok('China::IdentityCard::Validate') };

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

is(validate_id('11010519491231002X'), 1, 'test a certain ture id no.');
is(validate_id('110105194912310021'), 0, 'test a faked id no.');