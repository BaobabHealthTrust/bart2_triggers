#!/bin/bash

usage(){
    echo "Usage: $0 DATABASE USERNAME PASSWORD"
    echo
}

DB=$1
USER=$2
PASS=$3

if [ -z "$DB" ] || [ -z "$USER" ] || [ -z "$PASS" ] ; then
    usage
    exit
fi

FILES=schema/*.sql
for f in $FILES
do
	echo "Installing $f..."
	mysql --user=$USER --password=$PASS $DB < $f
done

FILES=triggers/updated_flat_tables/*.sql
for f in $FILES
do
	echo "Installing $f..."
	mysql --user=$USER --password=$PASS $DB < $f
done
