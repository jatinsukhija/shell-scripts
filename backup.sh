#backup.sh
#!/bin/bash

# Define backup directory and destination
SOURCE_DIR="/home/jatin"  # Change this to the directory you want to back up
BACKUP_DIR="/tmp/jatin"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create the backup archive
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Print success message
echo "✅ Backup created: $BACKUP_FILE"
