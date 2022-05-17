eval "$(oh-my-posh init zsh --config ~/.poshthemes/night-owl.omp.json)"

# Environment variables
export EDITOR="vim"
# export GOPATH="$HOME/code/go"
export PATH="$PATH:$HOME/.dotnet/tools:/usr/local/go/bin"

# Aliases
alias ll="ls -al"
alias cl="clear"
alias pwsh="pwsh -nologo"
alias tf="terraform"

# Key bindings
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3;5~" delete-word
