#!/bin/bash

# Read database name from config file
DB_NAME=$(cat config.txt)

# Generate Dockerfile with database name
cat <<EOF > Dockerfile
FROM $DB_NAME:latest

ENV MYSQL_ROOT_PASSWORD=$DB_NAME
ENV MYSQL_DATABASE=$DB_NAME
ENV MYSQL_USER=$DB_NAME
ENV MYSQL_PASSWORD=$DB_NAME
EOF

# Build Docker image with specified database name
DB_IMAGE_NAME="db-$DB_NAME:latest"
docker build -t $DB_IMAGE_NAME .
docker run --name $DB_NAME $DB_IMAGE_NAME


# Check if Docker container is down and restart if necessary
while true
do

CONTAINER_STATUS=$(docker ps -f name=$DB_NAME --format '{{.Status}}')
if [[ $CONTAINER_STATUS != *"Up"* ]]; then
  docker rm $DB_NAME
  sleep 2
  echo "DB Container down, initiating running ..."
  docker run -d --name $DB_NAME $DB_IMAGE_NAME
fi
  # Wait for 10 seconds before checking again
  sleep 2
 done 