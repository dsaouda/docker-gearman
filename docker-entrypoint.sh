#!/bin/bash

cat <<-EOSUPERVISOR > /etc/supervisor/conf.d/gearman.conf
[program:gearman]
command=/usr/sbin/gearmand -p 4730 -u root
autostart=true
autorestart=true
stderr_logfile=/var/log/gearman-job-server.err.log
stdout_logfile=/var/log/gearman-job-server.out.log
EOSUPERVISOR

/usr/bin/supervisorctl update
supervisord -c /etc/supervisor/supervisord.conf