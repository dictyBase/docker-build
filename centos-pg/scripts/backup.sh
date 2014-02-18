#!/bin/bash

CONTNAME=$1
VOLUME=$2
HOSTVOL=$3
BACKUP=$4
DOCKER=`(which docker)`


if $DOCKER ps -a | grep $CONTNAME &>/dev/null ; then
    file=$(date +%b)-pgdata.tar
    $DOCKER run -i -t -v  $HOSTVOL:$BACKUP -name databackup --volumes-from $CONTNAME busybox tar cf $BACKUP/$file -C $VOLUME .
    cp $HOSTVOL/$file $HOSTVOL/current.tar
    $DOCKER rm databackup
else
    echo no $CONTNAME container .... nothing to do
fi
