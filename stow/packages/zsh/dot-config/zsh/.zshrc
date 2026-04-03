# My config files
[[ -f "$ZDOTDIR/aliases.zsh" ]] && source "$ZDOTDIR/aliases.zsh"
[[ -f "$ZDOTDIR/completion.zsh" ]] && source "$ZDOTDIR/completion.zsh"
[[ -f "$ZDOTDIR/functions.zsh" ]] && source "$ZDOTDIR/functions.zsh"
[[ -f "$ZDOTDIR/history.zsh" ]] && source "$ZDOTDIR/history.zsh"
[[ -f "$ZDOTDIR/keybinds.zsh" ]] && source "$ZDOTDIR/keybinds.zsh"

# Tool setup
[[ -f "/usr/share/fzf/completion.zsh" ]] && source "/usr/share/fzf/completion.zsh"
[[ -f "/usr/share/fzf/key-bindings.zsh" ]] && source "/usr/share/fzf/key-bindings.zsh"
eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
