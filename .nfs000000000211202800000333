#!/bin/bash

function handle_int() {
	echo "Stopping mysql"
	kill `cat $PID_FILE`
	wait `cat $PID_FILE`
}

trap handle_int INT

#DATA_BASE_DIR=/tmp/mysql
PID_FILE=/tmp/mysql/mysqld.pid #/var/run/mysqld/mysqld.pid
SOCKET_FILE=/tmp/mysql/mysqld.sock # /var/run/mysqld/mysqld.sock
PORT=8806 # 3306
BASE_DIR=/usr
DATA_DIR=/tmp/mysql/data #/var/lib/mysql
LOG_ERROR=/tmp/msyql/error.log #/var/log/mysql/error.log
DB_NAME=siw

rm -rf $DATA_DIR
mkdir -p $DATA_DIR

mysql_install_db --datadir=$DATA_DIR --user=`whoami`

( mysqld --user=mysql --pid-file=$PID_FILE --socket=$SOCKET_FILE --port=$PORT --basedir=$BASE_DIR --datadir=$DATA_DIR --tmpdir=/tmp --lc-messages-dir=/usr/share/mysql --skip-external-locking --bind-address=127.0.0.1 --key_buffer=16M --max_allowed_packet=16M --thread_stack=192K --thread_cache_size=8 --myisam-recover=BACKUP --query_cache_limit=1M --query_cache_size=16M --log_error=$LOG_ERROR --expire_logs_days=10 --max_binlog_size=100M ) &

sleep 3

mysql --protocol=TCP --port=$PORT -u root <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME
EOF

echo MySQL PID is `cat $PID_FILE`
echo Listening on port $PORT and socket $SOCKET_FILE

wait `cat $PID_FILE`




