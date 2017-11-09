#!/bin/bash

case $1 in
	active)
		curl -s http://127.0.0.1/nginx_status | awk '/Active/ {print $3}' ;;
	accepts)
		curl -s http://127.0.0.1/nginx_status | awk 'NR==3 {print $1}' ;;
	handled)
		curl -s http://127.0.0.1/nginx_status | awk 'NR==3 {print $2}' ;;
	requests)
		curl -s http://127.0.0.1/nginx_status | awk 'NR==3 {print $3}' ;;
	reading)
		curl -s http://127.0.0.1/nginx_status | awk '/Reading/ {print $2}' ;;
	writing)
		curl -s http://127.0.0.1/nginx_status | awk '/Writing/ {print $4}' ;;
	waiting)
		curl -s http://127.0.0.1/nginx_status | awk '/Waiting/ {print $6}' ;;
	*)
		echo "Usage: $0 { active | accepts | handled | requests | reading | writing | waiting }" ;;
esac
