# TODO: GNU stow stuff.

# install required packages
# TODO: handle different distros
sudo pacman -S base-devel neovim zsh lua-language-server

mkdir $HOME/.cache
git clone https://aur.archlinux.org/yay.git $HOME/.cache/yay
makepkg -si $HOME/.cache/yay

yay -S --answerdiff None --answerclean All omnisharp-roslyn-bin

# install the 'packer' neovim package and install/sync all neovim plugins.
PACKAGE_PATH=$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
mkdir -p $PACKAGE_PATH
git clone --depth 1 https://github.com/wbthomason/packer.nvim $PACKAGE_PATH
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
