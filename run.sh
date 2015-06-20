#!/bin/bash
require_env=(
MYSQL_PORT_3306_TCP_ADDR
MYSQL_PORT_3306_TCP_PORT
DB_USER
DB_PWD
DB_NAME
UIC_URL
UIC_TOKEN
REGISTRY_URL
)
for i in ${require_env[@]}; do
    if [ x${!i} == 'x' ]; then
        echo "Need env ${i}"
        exit 1;
    fi
done
confFile=$GOPATH/src/github.com/dinp/builder/conf/app.conf
sed -i "s/{DB_HOST}/${MYSQL_PORT_3306_TCP_ADDR}/g" $confFile \
&& sed -i "s/{DB_PORT}/${MYSQL_PORT_3306_TCP_PORT}/g" $confFile \
&& sed -i "s/{DB_USER}/${DB_USER}/g" $confFile \
&& sed -i "s/{DB_NAME}/${DB_NAME}/g" $confFile \
&& sed -i "s/{DB_PWD}/${DB_PWD}/g" $confFile \
&& sed -i "s/{UIC_URL}/${UIC_URL}/g" $confFile \
&& sed -i "s/{UIC_TOKEN}/${UIC_TOKEN}/g" $confFile \
&& sed -i "s/{REGISTRY_URL}/${REGISTRY_URL}/g" $confFile

cd $GOPATH/src/github.com/dinp
./builder
