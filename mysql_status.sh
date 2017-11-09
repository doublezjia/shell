#!/bin/bash

export PATH=$PATH:/usr/local/mysql/bin
mysqlcon="mysqladmin"

case $1 in
	Uptime)
		result=`$mysqlcon status|awk '/Uptime/ {print $2}' `
		echo $result 
 	;;
	Questions)
		result=`$mysqlcon status|awk '/Questions/ {print $6}'`
		echo $result
	;;
 	Slow_queries)
		result=`$mysqlcon status|awk '/Slow/ {print $9}' `
		echo $result 
 	;;	
 	Com_select)
		result=`$mysqlcon extended-status | grep -w 'Com_select' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Com_insert)
		result=`$mysqlcon extended-status | grep -w 'Com_insert' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Com_update)
		result=`$mysqlcon extended-status | grep -w 'Com_update' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Com_delete)
		result=`$mysqlcon extended-status | grep -w 'Com_delete' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Com_rollback)
		result=`$mysqlcon extended-status | grep -w 'Com_rollback' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Com_commit)
		result=`$mysqlcon extended-status | grep -w 'Com_commit' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Com_begin)
		result=`$mysqlcon extended-status | grep -w 'Com_begin' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Bytes_sent)
		result=`$mysqlcon extended-status | grep -w 'Bytes_sent' | awk '{print $(NF-1)}'`
		echo $result
	;;
 	Bytes_received)
		result=`$mysqlcon extended-status | grep -w 'Bytes_received' | awk '{print $(NF-1)}'`
		echo $result
	;;
	*)
		echo "Usage:$0(Uptime|Questions|Slow_queries|Com_select|Com_insert|Com_update|Com_delete|Com_rollback|Com_commit|Com_begin|Bytes_sent|Bytes_received)"
	;;
esac

