#!/bin/bash

APP_NAME=spring-config-server;

default_label=$1

if [[ -z $PW ]];
then
    echo 'Spring Cloud Git server label/branch not specified, will use default "develop"';
    default_label="develop";
fi

jasypt=$(cat jasypt_password);
pem=$(cat privatekey);

echo "Stopping container ${APP_NAME}";
docker stop ${APP_NAME} > /dev/null 2>&1;

echo "Deleting container ${APP_NAME}";
docker rm ${APP_NAME} > /dev/null 2>&1;

docker run -d -p 8888:8888 -e "GIT_BRANCH=$default_label" -e "SSH_KEY=$pem" -e "JAVA_TOOL_OPTIONS=-Djasypt.encryptor.password=$jasypt" --name ${APP_NAME} ${APP_NAME}:latest