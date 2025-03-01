cat /var/log/syslog | awk '{CMD[$5]++} END {for (a in CMD) print CMD[a], a;}' | sort -nr | head -1
