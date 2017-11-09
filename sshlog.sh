#!/bin/bash
seclog='/var/log/secure'
seclogbakpath='/var/log/securelogbak/'
datename=`date -d 'yesterday' +'%Y%m%d'`

if [ ! -d $seclogbakpath ];then
	mkdir $seclogbakpath
fi
mv $seclog $seclogbakpath'secure-'$datename
find $seclogbakpath -mtime +15  -name 'secure-*' -exec rm -rf {} \;
service sshd restart
service rsyslog restart
