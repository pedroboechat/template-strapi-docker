#!/bin/bash

if [ -f "/strapi/package.json" ]; then
    echo ">> Starting Strapi"
    cd /strapi
    strapi start
else
    echo ">> Creating Strapi project"
    strapi new\
        --no-run\
        --dbclient="$DB_CLIENT"\
        --dbhost="$DB_HOST"\
        --dbport="$DB_PORT"\
        --dbname="$DB_NAME"\
        --dbusername="$DB_USER"\
        --dbpassword="$DB_PSWD"\
        --dbssl="$DB_SSL"\
        strapi

    echo ">> Disabling Strapi telemetry"
    strapi telemetry:disable
    
    echo ">> Starting Strapi"
    cd /strapi
    strapi start
fi
