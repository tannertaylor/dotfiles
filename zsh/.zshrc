eval "$(oh-my-posh init zsh --config ~/.poshthemes/ys.omp.json)"

# Environment variables
export EDITOR="vim"
export PATH="$PATH:$HOME/.dotnet/tools:/usr/local/go/bin:/opt/kotlinc/bin"

# Aliases
alias ll="ls -al"
alias cl="clear"
alias pwsh="pwsh -nologo"
alias tf="terraform"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Key bindings
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3;5~" delete-word
