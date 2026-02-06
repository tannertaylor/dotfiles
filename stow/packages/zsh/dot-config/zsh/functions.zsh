function cd() {
  if [[ -z $@ ]]; then
    builtin cd || exit
  elif [[ $@ == "-" ]]; then
    builtin cd -
  else
    zoxide add "$@" && builtin cd "$@" || exit
  fi
}

