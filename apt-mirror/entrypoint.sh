#!/bin/bash

set -xe

cd "$(dirname "$0")"

UPDATE_INTERVAL_SECONDS=${UPDATE_INTERVAL_SECONDS:-"86400"}

sed 's/#quiet_mode/quiet_mode/g' -i /etc/proxychains.conf
sed 's/socks4/socks5/g' -i /etc/proxychains.conf

mkdir -pv /var/spool/apt-mirror/{mirror,skel,var}
while true; do
  date
  touch /var/spool/apt-mirror/mirror/last_mirror_run.log
  #proxychains apt-mirror
  apt-mirror
  sleep "$UPDATE_INTERVAL_SECONDS"
done
