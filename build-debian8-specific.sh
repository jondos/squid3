#!/bin/bash

# call configure for debian8 specific settings
./configure --prefix=/usr \
	--enable-http-violations \
	--disable-header-reordering \
	--localstatedir=/var \
	--libexecdir=${prefix}/lib/squid3 \
	--datadir=${prefix}/share/squid3 \
	--sysconfdir=/etc/squid3 \
	--with-default-user=proxy \
	--with-logdir=/var/log/squid3 \
	--with-pidfile=/var/run/squid3.pid
