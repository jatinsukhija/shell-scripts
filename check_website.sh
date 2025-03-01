#!/bin/bash

# Website to check
WEBSITE="https://learnxops.com"

# Timeout duration (in seconds)
TIMEOUT=5

# Check website reachability using curl
if curl -Is --connect-timeout $TIMEOUT $WEBSITE | head -n 1 | grep "200\|301\|302" > /dev/null; then
    echo "✅ Website $WEBSITE is reachable."
else
    echo "❌ Website $WEBSITE is not reachable!"
fi

