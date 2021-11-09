# Set custom prompt
PROMPT="%n@%m | %1~ > "

# Aliases
alias ll="ls -al"
alias vim="nvim"

# Key bindings
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-word

# PATH updates
export PATH="$PATH:/home/tanner/.dotnet/tools"

# Shell start-up display
echo
neofetch
