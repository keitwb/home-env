#!/bin/bash

inotifywait --monitor --quiet --event create,moved_to --recursive --format '%w/%f' ~/Mail/*/INBOX/new | while read inboxfile; do
  from=$(grep From: $inboxfile)
  subject=$(grep Subject $inboxfile)
  notify-send -t 4000 -i emblem-mail "$from$subject"
done
