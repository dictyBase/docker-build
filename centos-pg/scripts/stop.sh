#!/bin/bash


DOCKER=`which docker`
PGIMAGE=$1
CONTNAME=$2
if $DOCKER ps | grep $PGIMAGE &>/dev/null; then
    id=`$DOCKER ps | grep -v CONTAINER | grep $PGIMAGE | cut -f1 -d ' '`
    $DOCKER stop $id
    $DOCKER rm $id
else
    echo $PGIMAGE is not running.....nothing to stop
    exit 1
fi

