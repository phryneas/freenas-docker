#!/bin/bash
adblock2privoxy -t /etc/privoxy/ab2p.task

/usr/sbin/privoxy --no-daemon /etc/privoxy/config &
PID=$!

while true; do
	sleep $(( 24 * 60 * 60 ));
	adblock2privoxy -t /etc/privoxy/ab2p.task
	kill -s SIGHUP $PID
done
