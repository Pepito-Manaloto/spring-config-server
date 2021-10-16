#!/bin/bash

APP_NAME=spring-config-server;

jasypt=$(cat jasypt_password);
pem=$(cat privatekey);

echo "Stopping container ${APP_NAME}";
docker stop ${APP_NAME} > /dev/null 2>&1;

echo "Deleting container ${APP_NAME}";
docker rm ${APP_NAME} > /dev/null 2>&1;

docker run -d -p 8888:8888 -e "SSH_KEY=$pem" -e "JAVA_TOOL_OPTIONS=-Djasypt.encryptor.password=$jasypt" --name spring-config-server spring-config-server:latest