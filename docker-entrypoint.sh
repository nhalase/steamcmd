#!/usr/bin/env bash

set -e

# Change the UID if needed
if [ ! "$(id -u steam)" -eq "$UID" ]; then
  echo "Changing steam uid to $UID."
  usermod -o -u "$UID" steam
fi

# Change GID if needed
if [ ! "$(id -g steam)" -eq "$GID" ]; then
  echo "Changing steam gid to $GID."
  groupmod -o -g "$GID" steam
fi

if [ "$1" = '/home/steam/steamcmd/steamcmd.sh' ] || [ "$1" = 'steamcmd' ] || [ "$1" = 'steamcmd.sh' ]; then
  shift
  su-exec "$UID":"$GID" /home/steam/steamcmd/steamcmd.sh "$@"
else
  su-exec "$UID":"$GID" "$@"
fi
