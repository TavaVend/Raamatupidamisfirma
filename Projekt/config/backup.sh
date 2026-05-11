#!/bin/sh

# Manager.io andmete automaatne varundamine
# Käivitub iga päev automaatselt

DATE=$(date +%Y-%m-%d)
BACKUP_DIR="/backup"
FILENAME="managerio-backup-$DATE.tar.gz"

echo "Alustan varundamist: $FILENAME"

# Tee varukoopia kõigist Manager.io andmetest
tar -czf $BACKUP_DIR/$FILENAME /data

echo "Varukoopia tehtud: $FILENAME"

# Kustuta vanemad kui 7 päeva varukoopiad
find $BACKUP_DIR -name "managerio-backup-*.tar.gz" -mtime +${BACKUP_RETENTION_DAYS:-7} -delete

echo "Vana varundus koristatud. Valmis."
