#!/bin/bash

# Read database name and image version from config file
source config.ini

# Check if backup file exists
BACKUP_FILE="backup/backup.sql"
if [ ! -f "${BACKUP_FILE}" ]; then
  echo "Backup file not found at ${BACKUP_FILE}"
  exit 1
fi

# Restore database
case ${IMAGE} in
  "mysql")
    docker exec -i ${DATABASE} sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < ${BACKUP_FILE}
    ;;
  "postgres")
    docker exec -i ${DATABASE} sh -c 'exec psql -U postgres' < ${BACKUP_FILE}
    ;;
  *)
    echo "Unsupported database type: ${IMAGE}"
    exit 1
    ;;
esac

echo "Database restored successfully"
