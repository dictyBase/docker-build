#!/bin/bash

# config file
CONF_FILE=/var/www/kibana3/config.js

# nginx
NGINX=$(which nginx)

# argument
ARGS="-c /etc/nginx/nginx.conf"

if [ ${ELASTIC_PORT_9200_TCP_ADDR+defined} ]; then
    read -r -d '' config <<-EOC
/**
 * These is the app's configuration, If you need to configure
 * the default dashboard, please see dashboards/default
 */
define(['settings'],
function (Settings) {
  

  return new Settings({

    /**
     * URL to your elasticsearch server. You almost certainly don't
     * want 'http://localhost:9200' here. Even if Kibana and ES are on
     * the same host
     *
     * By default this will attempt to reach ES at the same host you have
     * elasticsearch installed on. You probably want to set it to the FQDN of your
     * elasticsearch host
     * @type {String}
     */
    elasticsearch: "http://${ELASTIC_PORT_9200_TCP_ADDR}:${ELASTIC_PORT_9200_TCP_PORT}",

    /**
     * The default ES index to use for storing Kibana specific object
     * such as stored dashboards
     * @type {String}
     */
    kibana_index: "kibana-int",

    /**
     * Panel modules available. Panels will only be loaded when they are defined in the
     * dashboard, but this list is used in the "add panel" interface.
     * @type {Array}
     */
    panel_names: [
      'histogram',
      'map',
      'pie',
      'table',
      'filtering',
      'timepicker',
      'text',
      'fields',
      'hits',
      'dashcontrol',
      'column',
      'derivequeries',
      'trends',
      'bettermap',
      'query',
      'terms'
    ]
  });
});

EOC
    echo "$config" > $CONF_FILE
    $NGINX $ARGS
else
    echo "need to be linked with an elasticsearch instance"
fi


