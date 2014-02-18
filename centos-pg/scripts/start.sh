#!/bin/bash

DOCKER=`which docker`
DATAIMAGE=$1
PGIMAGE=$2
CONTNAME=$3
USER=$4
if $DOCKER images | grep $DATAIMAGE &>/dev/null; then
    if $DOCKER ps -a | grep pgdata &>/dev/null; then
        echo docker container $DATAIMAGE exist
        echo remove it before running $PGIMAGE
        exit 1
    else
        $DOCKER run -name $CONTNAME $DATAIMAGE true
        $DOCKER run -rm --volumes-from $CONTNAME $PGIMAGE /run/pgsetup -P
        if [ ${USER+defined} ]; then
            $DOCKER run -rm --volumes-from $CONTNAME $PGIMAGE /run/pgsetup -C $USER
        fi
        $DOCKER run -d -p 5432:5432 --volumes-from $CONTNAME $PGIMAGE 
    fi
else
    echo create $DATAIMAGE image from pgdata folder
fi




