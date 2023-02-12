Simple Backup & Restore Script using Rsync

Backup script has been tested on latest KDE Neon. It should also work on Ubuntu-based distros.

BACKUP:

Modify backup folder and backup destination in config-file

Run script sh ./backup.sh

NOTE! 

It is highly recommended to add --dry-run argument to rsync command (rsync -avPz --dry-run /home/user /home/user/backups), before backing up to find errors.

EXCLUDE_LIST = Exclude files from backup. Usually folders and files that are only temporary and not needed. Modify EXCLUDE_LIST.txt to you liking.

####################################################################################################################################

RESTORE:

Still under construction

####################################################################################################################################

POST-INSTALL APPS

Install commonly used apps as flatpaks if available. Otherwise as debs.

####################################################################################################################################




