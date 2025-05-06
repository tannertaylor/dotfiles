#!/bin/sh

rclone mount proton: /home/tanner/Drive \
  --daemon \
  --vfs-cache-mode full \
  --log-file /var/log/rclone/proton-mount.log \
  --log-level INFO

