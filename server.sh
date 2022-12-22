#!/bin/bash

PORT=${1:-9323}
START_CRON=${2:-1}
PROM_FILE=pings.prom

if [ $START_CRON -eq 1 ]; then
    service cron start
fi

while true;
do { \
    echo -ne "HTTP/1.0 200 OK\r\nDate: $(date -u)\r\nCache-Control: private, max-age=0, no-cache\r\nContent-Type: text/plain; version=0.0.4; charset=utf-8\r\nContent-Length: $(wc -c <$PROM_FILE)\r\n\r\n"; \
    cat $PROM_FILE; \
} | nc -l -p $PORT ; \
done
