# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ensure powerlevel10k is installed.
POWERLEVEL10K_DIR=$HOME/.cache/zsh/powerlevel10k
if ! [ -d $POWERLEVEL10K_DIR ]; then
    mkdir -p $POWERLEVEL10K_DIR
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $POWERLEVEL10K_DIR
fi

source $POWERLEVEL10K_DIR/powerlevel10k.zsh-theme

# Aliases
alias ll="ls -al"
alias cl="clear"
alias tf="terraform"

# Key bindings
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3;5~" delete-word

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
