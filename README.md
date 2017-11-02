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

## Findings

After a *lot* of hours spent debugging a custom-built `squid` 3.5 binary in `gdb`, I finally caught an hint on where in the codebase the header reordering was happening.

It was happening in `client_side.cc`, lines 2699-2700: deleting and re-adding the same header modified the order too.

The solution was adding a new function called `HttpHeader::modifyById()`, which accepted the same parameters as `HttpHeader::delById()` and `HttpHeader::putStr()` and instead of deleting and adding, it just modifies the content of the already-present header.

To enable the solution implemented, Squid must be built with the `--disable_header_reordering` parameter passed to `configure`.

A new boolean configuration parameter has been added too, called `disable_header_reordering` - it is off by default, to enable it just put 

```
disable_header_reordering on
```

to the configuration file.
