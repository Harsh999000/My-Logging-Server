#!/bin/bash

TODAY=$(date +%F)
LOGFILE="/db1/myserver/mariadb/logs/startup-$TODAY.log"

nohup /db1/myserver/mariadb/bin/mysqld --defaults-file=/db1/myserver/mariadb/my.cnf > "$LOGFILE" 2>&1 &
