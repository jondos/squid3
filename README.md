# squid3
Fork of Squid3.5 - keep header order

We use Squid as a caching forward proxy. We need to keep the header order of the browser.
Problem: The current version of Squid 3.5 alters the order of the headers sent by the web browser. You can test this here:

https://ip-check.info/signature.php

The browser signature using the squid must be the same as without the proxy. It is not for squid 3.5.

Therefore we patch the current Squid, so that it keeps the header order:

http://www.squid-cache.org/Versions/

You find here a hint how to do it and where to find the critical code (Alex Rousskov):

http://squid-web-proxy-cache.1019090.n4.nabble.com/Header-order-in-squid-proxy-td4682889.html
http://lists.squid-cache.org/pipermail/squid-users/2017-June/015750.html
