PGIMAGE='cybersiddhu/centos-pg:9.2'
CONTNAME='pgdata'
DATAIMAGE='cybersiddhu/pgdata'
USER='chado'
VOLUME='/var/lib/pgsql'
HOSTVOL='backup'
BACKUP='/backup'


start:
	scripts/start.sh ${DATAIMAGE} ${PGIMAGE} ${CONTNAME} ${USER}

shutdown:
	scripts/stop.sh ${PGIMAGE} ${CONTNAME}

rm:
	docker rm ${CONTNAME}

stop: shutdown rm

build:
	docker build -rm -t ${PGIMAGE}

datadump:
	scripts/backup.sh ${CONTNAME} ${VOLUME} ${PWD}/${HOSTVOL} ${BACKUP}

backup: shutdown datadump rm

restore: 
	scripts/restore.sh ${DATAIMAGE} ${PGIMAGE} ${CONTNAME} ${VOLUME} ${PWD}/${HOSTVOL} ${BACKUP}
