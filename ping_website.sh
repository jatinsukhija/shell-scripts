#!/bin/bash

WEBSITE="learnxops.com"

if ping -c 3 $WEBSITE > /dev/null 2>&1; then
    echo "✅ Website $WEBSITE is reachable."
else
    echo "❌ Website $WEBSITE is not reachable!"
fi
