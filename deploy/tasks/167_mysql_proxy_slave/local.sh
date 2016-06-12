#!/bin/sh -ex
. ./local.conf

[ -n "$MYSQL_MASTER4" ]
echo "$MYSQL_MASTER4" > mysql_master4
grep '\.' mysql_master4 # IPv4 only

[ -n "$MYSQL_MASTER6" ]
[ -n "$MYSQL_SLAVE6" ]
echo "$MYSQL_MASTER6" > mysql_master6
echo "$MYSQL_SLAVE6" > mysql_slave6
grep ':' mysql_master6 # IPv6 only
grep ':' mysql_slave6 # IPv6 only
