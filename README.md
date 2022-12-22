# Bash Ping

Bash Ping is a docker container with a few bash scripts that ping defined servers and reports back in prometheus compatible response.

- Edit _hosts.txt_ to setup your servers
- Edit _crontab_ if you want to ping on a different time frame (default every one minute)
- Uses _curl_ not ping so if ICMP is off, you should still get a response if up
- Reports results to https://localhost:9323/metrics which can be used as a Grafana data source

