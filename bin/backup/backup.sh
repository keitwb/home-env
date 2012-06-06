#!/bin/bash -x

REALFILE=$0
# Account for symbolic link to script from cron dir
if [ -L $0 ]
then
    REALFILE=`readlink $0`
fi
BASEDIR=`dirname $REALFILE`

DESTDIR="benkeith@benkeith-server:/backup/laptop"
SSHCOMMAND="ssh -p 2222 -i /home/benkeith/.ssh/id_rsa"
BACKUPLOG="$BASEDIR/log/linux"
EXCLUDESFILE="$BASEDIR/backupexcludes"

# mount $BACKUPDIR
if [ -f $BACKUPLOG ]
then
	rm -f $BACKUPLOG
fi

DIRS="home etc var"

for d in $DIRS; do
	echo "INFO: Backing up dir '$d' onto '$SRCHOST:$DESTDIR'"
	rsync -e "$SSHCOMMAND" --delete --exclude-from=$EXCLUDESFILE --progress -riav /$d $DESTDIR >> $BACKUPLOG
done

# umount $BACKUPDIR
