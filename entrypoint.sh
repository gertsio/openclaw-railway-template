#!/bin/bash
set -e

IMAGE_BREW_DIR="/home/linuxbrew/.linuxbrew-image"

if [ ! -d /data/.linuxbrew ]; then
  cp -a "$IMAGE_BREW_DIR" /data/.linuxbrew
elif [ -d "$IMAGE_BREW_DIR" ] && [ ! -x /data/.linuxbrew/bin/gog ]; then
  cp -an "$IMAGE_BREW_DIR"/. /data/.linuxbrew/
fi

chown -R openclaw:openclaw /data
chmod 700 /data

rm -rf /home/linuxbrew/.linuxbrew
ln -sfn /data/.linuxbrew /home/linuxbrew/.linuxbrew

exec gosu openclaw node src/server.js
