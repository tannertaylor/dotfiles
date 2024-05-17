#!/bin/bash

scriptPath=$(realpath "$0")
scriptDir=$(dirname "$scriptPath")

bashrcPath="$HOME/.bashrc"
if [[ -f "$bashrcPath" ]]; then
  rm "$bashrcPath"
fi

bashProfilePath="$HOME/.bash_profile"
if [[ -f "$bashProfilePath" ]]; then
  rm "$bashProfilePath"
fi

dotfilesDir=$(realpath "$scriptDir/..")
stow -d "$dotfilesDir" -t "$HOME" --dotfiles home
stow -d "$dotfilesDir" -t "$HOME/.config" --dotfiles config

