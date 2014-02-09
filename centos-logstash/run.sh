#!/bin/bash

getip() {
    local ip=$(ip -4 -o addr show eth0 | awk '{split($4,a,"/"); print a[1]}')
    echo $ip
}


# Directory where the logstash all in one jar lives
LS_HOME=/opt/logstash

# Additional Java OPTS
LS_JAVA_OPTS="-Xmx256m -Djava.io.tmpdir=$LS_HOME/tmp"

# logstash log directory
LOG_DIR=/var/log/logstash

# logstash configuration directory
CONF_DIR=/etc/logstash/conf.d

# logstash log file
LOG_FILE=$LOG_DIR/logstash.log

# Filter threads
FILTER_THREADS=1


if [ ${ELASTIC_PORT_9200_TCP_ADDR+defined} ]; then
    read -r -d '' config <<-EOC
        input {
            syslog {
                type => syslog
                port => 5544
            }
        }

        output {
            stdout { debug => true }
            elasticsearch_http {
                host => "${ELASTIC_PORT_9200_TCP_ADDR}"
                port => ${ELASTIC_PORT_9200_TCP_PORT}
            }
        }

EOC
    # write the config file
    echo "$config" > ${CONF_DIR}/logstash.conf

    # set up options
    JAVA=`which java`
    JAR="${LS_HOME}/logstash.jar"
    ARGS="${LS_JAVA_OPTS} -jar ${JAR} agent --config ${CONF_DIR} --log ${LOG_FILE} -w ${FILTER_THREADS}"

    #start logstash
    $JAVA $ARGS
else
    read -r -d '' msg <<-EOC

    You need to link it with elasticsearch backend. Please use the docker -link
    parameter with *elastic* alias.

    docker run -d -link <name>:elastic cybersiddhu/centos-logstash

EOC
    echo "$msg"
fi



