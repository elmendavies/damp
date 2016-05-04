#!/bin/bash


function handle_int() {
	echo "Stopping apache2"
	kill $PID
	wait $PID
}



HTDOCS_DIR=`pwd`/htdocs
export HTDOCS_DIR

echo DocumentRoot \"$HTDOCS_DIR\"

if [[ ! -d $HTDOCS_DIR ]]; then
	mkdir -p $HTDOCS_DIR
	echo "Hola mundo" > $HTDOCS_DIR/index.html
	echo "Created index.html"
fi


apache2 -X -f `pwd`/httpd.conf &

PID=$!

echo PID is $PID

wait $PID






