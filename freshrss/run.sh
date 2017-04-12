#!/usr/bin/env bash

mkdir /run/php
/usr/sbin/php-fpm7.0
/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf &

while true; do
	php /var/www/html/app/actualize_script.php
	sleep $(( 15*60 ))
done
