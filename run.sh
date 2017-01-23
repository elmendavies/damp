#!/bin/bash

#######################
###  C L E A N U P  ###
#######################

function cleanup() {
	for PID_FILE in .sws/httpd.pid .sws/mysqld.pid; do
		if [[ -e $PID_FILE ]]; then 
			echo kill `cat $PID_FILE`
			kill `cat $PID_FILE`
		fi
	done
	echo "Goodbye"
	exit 
}

trap cleanup INT


#######################
####  A p a c h e  ####
#######################

HTTP_PORT=20080
APACHE_BIN="/usr/sbin/apache2 -X -f"

if [[ ! -d .sws ]]; then
	mkdir .sws
	if [[ ! -e index.html ]]; then
		echo "Creating index.html"
		cat > index.php <<EOF
<?php

echo "Hola mundo";

// Conectando, seleccionando la base de datos
\$link = mysql_connect('127.0.0.1:8806', 'root', '')
    or die('No se pudo conectar: ' . mysql_error());
echo 'Connected successfully';
mysql_select_db('mme') or die('No se pudo seleccionar la base de datos');

// Realizar una consulta MySQL
\$query = 'SHOW TABLES;';
\$result = mysql_query(\$query) or die('Consulta fallida: ' . mysql_error());

echo "Hola mund";

echo \$result;

EOF

	fi
fi

if [[ ! -e .sws/httpd.conf ]]; then

MODULE_DIR=/usr/lib/apache2/modules

cat > .sws/httpd.conf <<EOF

ServerRoot "/etc/apache2"

LoadModule mime_module ${MODULE_DIR}/mod_mime.so
LoadModule dir_module ${MODULE_DIR}/mod_dir.so
LoadModule auth_basic_module ${MODULE_DIR}/mod_auth_basic.so
LoadModule authn_anon_module ${MODULE_DIR}/mod_authn_anon.so
LoadModule mpm_prefork_module ${MODULE_DIR}/mod_mpm_prefork.so
LoadModule authz_core_module ${MODULE_DIR}/mod_authz_core.so
LoadModule php5_module ${MODULE_DIR}/libphp5.so

TypesConfig /etc/mime.types

PidFile $(pwd)/.sws/httpd.pid

Listen 0.0.0.0:${HTTP_PORT}

DocumentRoot "$(pwd)/"
DirectoryIndex index.html

LogLevel debug

ErrorLog $(pwd)/.sws/apache2.log

<Directory />
  AllowOverride None
#  Order Deny,Allow
#  Allow from all
#  Require all denied
#  AuthType None
</Directory>

<Directory "/usr/local/htdocs">
  Require all granted
</Directory>

<IfModule mod_php5.c>
    <FilesMatch "\.ph(p3?|tml)$">
	SetHandler application/x-httpd-php
    </FilesMatch>
    <FilesMatch "\.phps$">
	SetHandler application/x-httpd-php-source
    </FilesMatch>
    # To re-enable php in user directories comment the following lines
    # (from <IfModule ...> to </IfModule>.) Do NOT set it to On as it
    # prevents .htaccess files from disabling it.
    <IfModule mod_userdir.c>
        <Directory /home/*/public_html>
            php_admin_value engine Off
        </Directory>
    </IfModule>
</IfModule>

EOF
fi

grep Listen .sws/httpd.conf

$APACHE_BIN `pwd`/.sws/httpd.conf &

#######################
#####  M Y S Q L  #####
#######################

MYSQLD_BIN=/usr/sbin/mysqld
MYSQL_PORT=8806
MYSQL_SOCKET_FILE=`pwd`/.sws/mysqld.sock
DB_NAME=`whoami`

rm -rf .sws/data
mkdir -p .sws/data

INIT_DB=`mktemp`

cat > $INIT_DB <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME
EOF


mysql_install_db --datadir=`pwd`/.sws/data --user=`whoami`

( $MYSQLD_BIN --user=mysql --pid-file=`pwd`/.sws/mysqld.pid --socket=${MYSQL_SOCKET_FILE} --port=${MYSQL_PORT} --basedir=/usr --datadir=`pwd`/.sws/data --tmpdir=/tmp --lc-messages-dir=/usr/share/mysql --skip-external-locking --bind-address=127.0.0.1 --key_buffer=16M --max_allowed_packet=16M --thread_stack=192K --thread_cache_size=8 --myisam-recover=BACKUP --query_cache_limit=1M --query_cache_size=16M --log_error=`pwd`/.sws/mysql.log --expire_logs_days=10 --max_binlog_size=100M --init-file=$INIT_DB ) &



#######################
####  F I N I S H  ####
#######################

sleep 3

echo Apache: You can browse at: http://localhost:${HTTP_PORT}
echo Mysql: Listening on port $MYSQL_PORT and socket $MYSQL_SOCKET_FILE



wait
cleanup


