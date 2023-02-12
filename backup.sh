#!/bin/bash

DATE=`date +%Y-%m-%d`
SCRIPT_DIR="$(cd $(dirname $0) && pwd)"
LOG_DIR=$SCRIPT_DIR/logs
EXCLUDE_LIST='$SCRIPT_DIR/exclude_list.txt'

## Check if logs-directory exists ##

if [ ! -d "$LOG_DIR" ]
then
  echo "Created log directory in script-folder"
  mkdir $SCRIPT_DIR/logs
fi

## Delete 30 days or older logs

find $LOG_DIR -mtime +30 -type f -delete

## Check if rsync is installed

if ! command -v rsync > /dev/null 2>&1
then
  echo "This script requires rsync to be installed"
  echo "Please install rsync with your package manager"
  exit 2
fi   

## Show notification

echo "Starting backup"
notify-send -u normal -t 10000 --app-name=Rsync "Backup started" --icon=mintbackup

## Back HOME with rsync
. $SCRIPT_DIR/config
/usr/bin/rsync -avPz --delete --exclude-from $SCRIPT_DIR/exclude_list.txt $BACKUP_SOURCE $BACKUP_DESTINATION > $LOG_DIR/backup-${DATE}.txt

## Check if backup was successful

if [ "$?" -eq "0" ]
then
  echo "Backup complete"
  notify-send -u normal -t 10000 --app-name=Rsync "Backup successful" --icon=mintbackup


else
  echo "Error while running rsync"
  notify-send -u critical -t --app-name=Rsync "Error with backup" "Please check logs in the logs-directory to find out what went wrong in the" --icon=error

fi