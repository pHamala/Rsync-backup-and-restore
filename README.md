# Simple Backup & Restore Script using Rsync

Backup script has been tested on latest KDE Neon. It should also work on Ubuntu-based distros.

--------------------------------------------------------------------------------

## BACKUP:

Modify backup folder and backup destination in config-file

Run script sh ./backup.sh

Rsync is run with following options:

rsync -avlz --delete --update --existing --progress --human-readable --exclude-from

a = Archive-mode. It synchronizes directories recursively and keeps the ownership of users and groups, permissions, symbolic links and timestamps

v = Verbose. Increase verbosity

l = Copies symlinks as symlinks

z = Compress file data during transfer

--progress = Show progress information in the logs

--delete = Deletes files that do not exist in the source directory

--update = skip files that are newer on the receiver

--existing = skip creating new files on receiver

--human-readable = Easier to read file sizes

--exclude-from = Exclude files and directories from exclude_list.txt


### NOTE! 

It is highly recommended to add --dry-run argument to rsync command (rsync -avPz --dry-run /home/user /home/user/backups), before first backup.

EXCLUDE_LIST = Exclude files from backup. Modify EXCLUDE_LIST.txt to you liking.

--------------------------------------------------------------------------------

## RESTORE:

To restore backup from server of backup-media, modify backup source and destination in the config file.

--------------------------------------------------------------------------------

## POST-INSTALL APPS

Install commonly used apps as flatpaks if available. Otherwise as debs.

--------------------------------------------------------------------------------




