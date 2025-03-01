#!/bin/bash

# Check if a filename is provided as an argument
if [ $# -eq 0 ]; then
    echo "❌ Usage: $0 <filename>"
    exit 1
fi

FILENAME="$1"

# Check if the file exists
if [ -f "$FILENAME" ]; then
    echo "✅ File '$FILENAME' exists. Printing content:"
    cat "$FILENAME"
else
    echo "❌ Error: File '$FILENAME' does not exist!"
fi

