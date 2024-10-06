#!/usr/bin/env

if [ -z "$NVIM_REMOTE" ]; then
  nvim "$@"
else
  NVIM_FILES=$(echo "$@" | tr ' ' '~')
  nvim --server "$NVIM_REMOTE" --remote-send "<c-\\><c-n>:close! | :lua tt.utils.edit_multiple_files('$NVIM_FILES')<cr>"
fi

