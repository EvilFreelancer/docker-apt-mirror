#!/bin/bash

set -xe

cd "$(dirname "$0")"

UPDATE_INTERVAL_SECONDS=${UPDATE_INTERVAL_SECONDS:-"86400"}

mkdir -pv /var/spool/apt-mirror/{mirror,skel,var}
while true; do
  date
  touch /var/spool/apt-mirror/last_mirror_run.log
  apt-mirror
  /app/update_ip.sh
  sleep "$UPDATE_INTERVAL_SECONDS"
done
