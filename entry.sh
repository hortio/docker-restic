#!bin/sh
set -e

echo "Starting container ..."

RESTIC_CMD=restic

if [ -n "${ROOT_CERT}" ]; then
	RESTIC_CMD="${RESTIC_CMD} --cert ${ROOT_CERT}"
fi

echo "Setup backup cron job with cron expression BACKUP_CRON: ${BACKUP_CRON}"
echo "${BACKUP_CRON} /bin/backup >> /var/log/cron.log 2>&1" > /var/spool/cron/crontabs/root

# Make sure the file exists before we start tail
touch /var/log/cron.log

# start the cron deamon
crond

echo "Container started."

tail -fn0 /var/log/cron.log
