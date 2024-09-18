function cd() {
  if [ -z "$@" ]; then
    builtin cd || exit
  else
    zoxide add "$@" && builtin cd "$@" || exit
  fi
}

