#!/bin/bash

PATH="$PATH:~/bin/:/usr/local/sbin/:/usr/sbin/:/sbin/"


#######################
####  C o n f i g  ####
#######################



#######################
####  C o m m o n  ####
#######################

if [[ ! -d .sws ]]; then
	mkdir .sws
fi

if [[ ! -e LICENCE ]]; then

cat > LICENCE <<EOFLICENCE


                                 Apache License
                           Version 2.0, January 2004
                        http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

      "License" shall mean the terms and conditions for use, reproduction,
      and distribution as defined by Sections 1 through 9 of this document.

      "Licensor" shall mean the copyright owner or entity authorized by
      the copyright owner that is granting the License.

      "Legal Entity" shall mean the union of the acting entity and all
      other entities that control, are controlled by, or are under common
      control with that entity. For the purposes of this definition,
      "control" means (i) the power, direct or indirect, to cause the
      direction or management of such entity, whether by contract or
      otherwise, or (ii) ownership of fifty percent (50%) or more of the
      outstanding shares, or (iii) beneficial ownership of such entity.

      "You" (or "Your") shall mean an individual or Legal Entity
      exercising permissions granted by this License.

      "Source" form shall mean the preferred form for making modifications,
      including but not limited to software source code, documentation
      source, and configuration files.

      "Object" form shall mean any form resulting from mechanical
      transformation or translation of a Source form, including but
      not limited to compiled object code, generated documentation,
      and conversions to other media types.

      "Work" shall mean the work of authorship, whether in Source or
      Object form, made available under the License, as indicated by a
      copyright notice that is included in or attached to the work
      (an example is provided in the Appendix below).

      "Derivative Works" shall mean any work, whether in Source or Object
      form, that is based on (or derived from) the Work and for which the
      editorial revisions, annotations, elaborations, or other modifications
      represent, as a whole, an original work of authorship. For the purposes
      of this License, Derivative Works shall not include works that remain
      separable from, or merely link (or bind by name) to the interfaces of,
      the Work and Derivative Works thereof.

      "Contribution" shall mean any work of authorship, including
      the original version of the Work and any modifications or additions
      to that Work or Derivative Works thereof, that is intentionally
      submitted to Licensor for inclusion in the Work by the copyright owner
      or by an individual or Legal Entity authorized to submit on behalf of
      the copyright owner. For the purposes of this definition, "submitted"
      means any form of electronic, verbal, or written communication sent
      to the Licensor or its representatives, including but not limited to
      communication on electronic mailing lists, source code control systems,
      and issue tracking systems that are managed by, or on behalf of, the
      Licensor for the purpose of discussing and improving the Work, but
      excluding communication that is conspicuously marked or otherwise
      designated in writing by the copyright owner as "Not a Contribution."

      "Contributor" shall mean Licensor and any individual or Legal Entity
      on behalf of whom a Contribution has been received by Licensor and
      subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      copyright license to reproduce, prepare Derivative Works of,
      publicly display, publicly perform, sublicense, and distribute the
      Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
      this License, each Contributor hereby grants to You a perpetual,
      worldwide, non-exclusive, no-charge, royalty-free, irrevocable
      (except as stated in this section) patent license to make, have made,
      use, offer to sell, sell, import, and otherwise transfer the Work,
      where such license applies only to those patent claims licensable
      by such Contributor that are necessarily infringed by their
      Contribution(s) alone or by combination of their Contribution(s)
      with the Work to which such Contribution(s) was submitted. If You
      institute patent litigation against any entity (including a
      cross-claim or counterclaim in a lawsuit) alleging that the Work
      or a Contribution incorporated within the Work constitutes direct
      or contributory patent infringement, then any patent licenses
      granted to You under this License for that Work shall terminate
      as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
      Work or Derivative Works thereof in any medium, with or without
      modifications, and in Source or Object form, provided that You
      meet the following conditions:

      (a) You must give any other recipients of the Work or
          Derivative Works a copy of this License; and

      (b) You must cause any modified files to carry prominent notices
          stating that You changed the files; and

      (c) You must retain, in the Source form of any Derivative Works
          that You distribute, all copyright, patent, trademark, and
          attribution notices from the Source form of the Work,
          excluding those notices that do not pertain to any part of
          the Derivative Works; and

      (d) If the Work includes a "NOTICE" text file as part of its
          distribution, then any Derivative Works that You distribute must
          include a readable copy of the attribution notices contained
          within such NOTICE file, excluding those notices that do not
          pertain to any part of the Derivative Works, in at least one
          of the following places: within a NOTICE text file distributed
          as part of the Derivative Works; within the Source form or
          documentation, if provided along with the Derivative Works; or,
          within a display generated by the Derivative Works, if and
          wherever such third-party notices normally appear. The contents
          of the NOTICE file are for informational purposes only and
          do not modify the License. You may add Your own attribution
          notices within Derivative Works that You distribute, alongside
          or as an addendum to the NOTICE text from the Work, provided
          that such additional attribution notices cannot be construed
          as modifying the License.

      You may add Your own copyright statement to Your modifications and
      may provide additional or different license terms and conditions
      for use, reproduction, or distribution of Your modifications, or
      for any such Derivative Works as a whole, provided Your use,
      reproduction, and distribution of the Work otherwise complies with
      the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
      any Contribution intentionally submitted for inclusion in the Work
      by You to the Licensor shall be under the terms and conditions of
      this License, without any additional terms or conditions.
      Notwithstanding the above, nothing herein shall supersede or modify
      the terms of any separate license agreement you may have executed
      with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
      names, trademarks, service marks, or product names of the Licensor,
      except as required for reasonable and customary use in describing the
      origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
      agreed to in writing, Licensor provides the Work (and each
      Contributor provides its Contributions) on an "AS IS" BASIS,
      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
      implied, including, without limitation, any warranties or conditions
      of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
      PARTICULAR PURPOSE. You are solely responsible for determining the
      appropriateness of using or redistributing the Work and assume any
      risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
      whether in tort (including negligence), contract, or otherwise,
      unless required by applicable law (such as deliberate and grossly
      negligent acts) or agreed to in writing, shall any Contributor be
      liable to You for damages, including any direct, indirect, special,
      incidental, or consequential damages of any character arising as a
      result of this License or out of the use or inability to use the
      Work (including but not limited to damages for loss of goodwill,
      work stoppage, computer failure or malfunction, or any and all
      other commercial damages or losses), even if such Contributor
      has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
      the Work or Derivative Works thereof, You may choose to offer,
      and charge a fee for, acceptance of support, warranty, indemnity,
      or other liability obligations and/or rights consistent with this
      License. However, in accepting such obligations, You may act only
      on Your own behalf and on Your sole responsibility, not on behalf
      of any other Contributor, and only if You agree to indemnify,
      defend, and hold each Contributor harmless for any liability
      incurred by, or claims asserted against, such Contributor by reason
      of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

      To apply the Apache License to your work, attach the following
      boilerplate notice, with the fields enclosed by brackets "[]"
      replaced with your own identifying information. (Don't include
      the brackets!)  The text should be enclosed in the appropriate
      comment syntax for the file format. We also recommend that a
      file or class name and description of purpose be included on the
      same "printed page" as the copyright notice for easier
      identification within third-party archives.

   Copyright [yyyy] [name of copyright owner]

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.


EOFLICENCE

	if [[ ! -e index.html ]]; then
		echo "Creating index.html"
		cat > index.php <<EOF

<?php

// Conectando, seleccionando la base de datos
\$link = mysql_connect('127.0.0.1:8806', 'root', '')
    or die('No se pudo conectar: ' . mysql_error());

mysql_select_db('mme') or die('No se pudo seleccionar la base de datos');

// Realizar una consulta MySQL
\$query = 'SHOW TABLES;';
\$result = mysql_query(\$query) or die('Consulta fallida: ' . mysql_error());

if(\$result) echo "Conexi&oacute;n a la base de datos satisfactoria";

EOF

	fi
fi


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
#####  M Y S Q L  #####
#######################

MYSQLD_BIN=mysqld
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

( $MYSQLD_BIN --user=mysql --pid-file=`pwd`/.sws/mysqld.pid --socket=${MYSQL_SOCKET_FILE} --port=${MYSQL_PORT} --basedir=/usr --datadir=`pwd`/.sws/data --tmpdir=/tmp --lc-messages-dir=/usr/share/mysql --skip-external-locking --bind-address=127.0.0.1 --key_buffer=16M --max_allowed_packet=16M --thread_stack=192K --thread_cache_size=8 --myisam-recover=BACKUP --query_cache_limit=1M --query_cache_size=16M --log_error=`pwd`/.sws/mysql.log --expire_logs_days=10 --max_binlog_size=100M --init-file=$INIT_DB) &

sleep 1

for i in `seq 1 10`; do
	if mysqladmin -u root -h 127.0.0.1 -P ${MYSQL_PORT} version; then
		echo "MySQL server up!!!!"
		break;
	else
		sleep 1
	fi
done

#######################
####  A p a c h e  ####
#######################

HTTP_PORT=20080
APACHE_BIN="apache2 -X -f"

if [[ ! -e .sws/httpd.conf ]]; then

MODULE_DIR=/usr/lib/apache2/modules

cat > .sws/httpd.conf <<EOF

ServerRoot "/etc/apache2"

LoadModule mime_module ${MODULE_DIR}/mod_mime.so
LoadModule dir_module ${MODULE_DIR}/mod_dir.so
LoadModule auth_basic_module ${MODULE_DIR}/mod_auth_basic.so
LoadModule authn_anon_module ${MODULE_DIR}/mod_authn_anon.so
<IfVersion >= 2.4>
LoadModule mpm_prefork_module ${MODULE_DIR}/mod_mpm_prefork.so
</IfVersion>
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

sleep 1

#######################
####  F I N I S H  ####
#######################

echo Apache: You can browse at: http://localhost:${HTTP_PORT}
echo Mysql: Listening on port $MYSQL_PORT and socket $MYSQL_SOCKET_FILE



wait
cleanup


