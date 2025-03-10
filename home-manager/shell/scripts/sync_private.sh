#!/usr/bin/env bash

rclone copy ~/Apollo.kdbx gdrive: -vv --update --checksum
rclone sync ~/Documents/ObsidianVaults/Mnemosyne/2025\ Cambridge/ gdrive:2025\ Cambridge -vv --update --checksum
rclone sync ~/Documents/ObsidianVaults/ gdrive-crypt:ObsidianVaults -vv --update --checksum
rclone sync ~/Personal/to_safe/ gdrive-crypt:access_denied -vv
rclone sync ~/Pictures/Photography/ gdrive:Documents/Photography -vv
