# Set custom prompt
PROMPT="%n@%m | %1~ > "

# Aliases
alias ll="ls -al"

# Key bindings
bindkey "^[[3~" delete-char
bindkey "^H" backward-delete-word

# Shell start-up display
echo
neofetch
