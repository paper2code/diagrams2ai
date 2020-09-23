#!/bin/sh

case "$1" in
  'build')
  	exec yarn build
	;;
  'start')
        exec yarn start
        ;;
  *)
        yarn build
  	exec yarn start
	;;
esac
