#!/usr/bin/env bash

rclone copy ~/Apollo.kdbx gdrive: -vv --update --checksum
rclone sync ~/Personal/to_safe/ gdrive-crypt:access_denied -vv
