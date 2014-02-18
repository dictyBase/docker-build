#!/bin/bash


DOCKER=`which docker`
DATAIMAGE=$1
PGIMAGE=$2
CONTNAME=$3
VOLUME=$4
HOSTVOL=$5
BACKUP=$6


if $DOCKER ps -a | grep $CONTNAME &>/dev/null ; then
    echo container $CONTNAME exist .... could not run restore
else
    if $DOCKER images | awk '{print $1":"$2}' | grep $PGIMAGE &>/dev/null; then
        file=current.tar
        if [ ! -e $HOSTVOL/$file ]; then 
            echo $file does not exist in $HOSTVOL
            exit 1
        fi
        $DOCKER run -i -t -v $HOSTVOL:$BACKUP -name $CONTNAME $DATAIMAGE busybox tar xf $BACKUP/$file -C $VOLUME
        $DOCKER run -d -p 5432:5432 --volumes-from $CONTNAME $PGIMAGE 
    else
        echo could not find $PGIMAGE .... nothing to restore
    fi
fi
