#!/bin/bash

APACHE_BIN="/usr/sbin/apache2 -X -f"

if [[ ! -d .sws ]]; then
	mkdir .sws
	if [[ ! -e index.html ]]; then
		echo "Creating index.html"
		echo "Hello" > index.html
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

Listen 0.0.0.0:20080

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

$APACHE_BIN `pwd`/.sws/httpd.conf












