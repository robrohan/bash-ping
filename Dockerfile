FROM ubuntu:22.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
        curl netcat cron \
    && rm -rf /var/lib/apt/lists/*

USER root
WORKDIR /root

COPY server.sh .
COPY ping.sh .
COPY hosts.txt .

RUN touch pings.prom

COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab && \
    crontab /etc/cron.d/crontab

RUN touch /var/log/cron.log

# CMD ["systemctl", "start", "cron"]

ENTRYPOINT ["./server.sh"]
