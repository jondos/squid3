#!/bin/bash

# call configure for debian9 specific settings
./configure --prefix=/usr \
	--enable-http-violations \
	--disable-header-reordering
	--localstatedir=/var \
	--libexecdir=${prefix}/lib/squid \
	--datadir=${prefix}/share/squid \
	--sysconfdir=/etc/squid \
	--with-default-user=proxy \
	--with-logdir=/var/log/squid \
	--with-pidfile=/var/run/squid.pid
