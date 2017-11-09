#!/bin/bash
access_log='/usr/local/nginx/var/log/access.log'
error_log='/usr/local/nginx/var/log/error.log'
logbakpath='/usr/local/nginx/var/log/logbak/'
datename=`date -d 'yesterday' +'%Y%m%d'`
if [ ! -d $logbakpath ];then
       mkdir $logbakpath
fi
mv $access_log $logbakpath'access_'$datename'.log'
mv $error_log $logbakpath'error_'$datename'.log'
find $logbakpath -mtime +15  -name 'access_*' -exec rm -rf {} \;
find $logbakpath -mtime +15  -name 'error_*' -exec rm -rf {} \;
service nginx restart
