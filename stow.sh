#!/bin/sh

ZSHENV_FILE=/etc/zsh/zshenv
if ! [ -f $ZSHENV_FILE ] || ! grep "export ZDOTDIR=" $ZSHENV_FILE > /dev/null 2>&1; then
    echo "export ZDOTDIR=\$HOME/.config/zsh" | sudo tee -a /etc/zsh/zshenv > /dev/null 2>&1
fi

stow -t $HOME/.config .
