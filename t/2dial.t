# $File: //member/autrijus/Geography-Country-Utils/t/2dial.t $ $Author: autrijus $
# $Revision: #1 $ $Change: 4087 $ $DateTime: 2003/02/05 04:03:47 $

use Test;
BEGIN { plan tests => 3 }

use Geography::Country::Utils qw(dialcode);

ok(defined &dialcode);
ok(dialcode('Sweden'), 46);

my $l2 = eval { require Net::Country; 1 };

skip(
    ($l2 ? 0 : "Skipping test on this platform"),
    eval { dialcode('NO') }, 47
);

