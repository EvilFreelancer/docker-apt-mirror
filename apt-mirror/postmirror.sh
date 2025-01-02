#!/bin/sh -e

bash /var/spool/apt-mirror/var/clean.sh

# Clean 0B files
find "/var/spool/apt-mirror/mirror/" -size 0 -exec rm -f {} \;
