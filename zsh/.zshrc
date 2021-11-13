# Set custom prompt
PROMPT="%n@%m | %1~ > "

# Aliases
alias ll="ls -al"
alias vim="nvim"

# Key bindings
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[3;5~" delete-word

# PATH updates
export PATH="$PATH:/home/tanner/.dotnet/tools"

# Shell start-up display
echo
neofetch
