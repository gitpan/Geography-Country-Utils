# $File: //member/autrijus/Geography-Country-Utils/t/1capital.t $ $Author: autrijus $
# $Revision: #1 $ $Change: 4087 $ $DateTime: 2003/02/05 04:03:47 $

use Test;
BEGIN { plan tests => 2 }

use Geography::Country::Utils qw(Capital);

ok(defined &Capital);
ok(Capital('SW'), 'Stockholm');
