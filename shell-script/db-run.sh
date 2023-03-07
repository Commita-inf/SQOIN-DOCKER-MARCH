#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker to continue."
    exit 1
fi

# Check if Docker is running
if ! docker info >/dev/null 2>&1; then
  echo "Docker is not running ..."
  exit 1
fi

# Read database configuration from config.ini file
source config.ini

# Set Dockerfile variables using values from config.ini
case ${IMAGE} in
  "mysql")
    cat <<EOF > Dockerfile
FROM mysql:${VERSION}

ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
EOF
    DB_IMAGE_NAME="db-${MYSQL_DATABASE}:${VERSION}"
    docker build -t ${DB_IMAGE_NAME} .
    ;;
  "postgres")
    cat <<EOF > Dockerfile
FROM postgres:${VERSION}

ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV POSTGRES_DB=${POSTGRES_DB}
EOF
    DB_IMAGE_NAME="db-${POSTGRES_DB}:${VERSION}"
    docker build -t ${DB_IMAGE_NAME} .
    ;;
  *)
    echo "Unsupported database type: ${IMAGE}"
    exit 1
    ;;
esac

DB_CONTAINER_NAME="db-${IMAGE}-container"
DOCKER_RUN="docker run -d --rm --name ${DB_CONTAINER_NAME} ${DB_IMAGE_NAME}"

# Run Docker container
${DOCKER_RUN}
 echo "${IMAGE} Database is running"

# Check if Docker container is down and restart if necessary
while true
do
  CONTAINER_STATUS=$(docker ps -f name=${DB_CONTAINER_NAME} --format '{{.Status}}')
  if [[ $CONTAINER_STATUS != *"Up"* ]]; then
    docker rm ${DB_CONTAINER_NAME}
    sleep 2
    echo "DB Container down, initiating running ..."
    ${DOCKER_RUN}
  fi
  # Wait for 10 seconds before checking again
  sleep 10
done
