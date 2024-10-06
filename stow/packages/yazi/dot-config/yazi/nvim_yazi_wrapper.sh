#!/usr/bin/env bash

if [[ -z $NVIM_REMOTE ]]; then
  nvim "$@"
else
  NVIM_FILES=$(echo "$@" | tr ' ' '~')
  echo "@ = $@"
  echo "NVIM_FILES = $NVIM_FILES"
  nvim --server "$NVIM_REMOTE" --remote-send "<c-\\><c-n>:close! | :lua tt.utils.edit_multiple_files(\"$NVIM_FILES\")<cr>"
fi

