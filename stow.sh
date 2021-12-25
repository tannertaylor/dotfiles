#!/bin/sh
stow --ignore=zsh -t $HOME/.config .
stow -t $HOME zsh
