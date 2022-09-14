#!/bin/bash
FILE=$1
BACKUPEXT=".BACK"
echo "Re-dumping <$FILE>"
if [[ -f "$FILE" ]]; then
        echo "Creating a backup file <$FILE$BACKUPEXT>"
        mv "$FILE" "$FILE$BACKUPEXT"
        dd if="$FILE$BACKUPEXT" of="$FILE" skip=387 bs=1M status=progress
        echo "Re-dump <$FILE> completed! You can delete the backup file <$FILE$BACKUPEXT>"
else
        echo "File <$FILE> doesn't exists. If you have a <$FILE$BACKUPEXT> backup file, rename it without the $BACKUPEXT extension."
fi
