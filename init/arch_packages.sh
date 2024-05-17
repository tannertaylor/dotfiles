#!/bin/bash

sudo pacman --noconfirm -S `
    base-devel ` # AUR packages
    zsh starship neofetch ` # Shells and shell-related
    git lazygit ` # VCS
    neovim tree-sitter ` # Neovim
    docker docker-compose ` # Containerization
    ripgrep stow # Utilities
