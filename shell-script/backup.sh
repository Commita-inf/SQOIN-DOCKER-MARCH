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

# Read database name and image version from config file
source config.ini

# Create backup directory if it doesn't exist
BACKUP_DIR="backup"
if [ ! -d "${BACKUP_DIR}" ]; then
  mkdir ${BACKUP_DIR}
fi

DB_CONTAINER_NAME="db-${IMAGE}-container"

# Backup database
case ${IMAGE} in
  "mysql")
    docker exec ${DB_CONTAINER_NAME} sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > ${BACKUP_DIR}/backup.sql
    ;;
  "postgres")
    docker exec ${DB_CONTAINER_NAME} sh -c 'exec pg_dumpall -U ${POSTGRES_USER}' > ${BACKUP_DIR}/backup.sql
    ;;
  *)
    echo "Unsupported database type: ${IMAGE}"
    exit 1
    ;;
esac

echo "Backup created successfully at ${BACKUP_DIR}/backup.sql"
