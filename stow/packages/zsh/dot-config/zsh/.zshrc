[[ -f "$ZDOTDIR/aliases.zsh" ]] && source "$ZDOTDIR/aliases.zsh"
[[ -f "$ZDOTDIR/completion.zsh" ]] && source "$ZDOTDIR/completion.zsh"
[[ -f "$ZDOTDIR/functions.zsh" ]] && source "$ZDOTDIR/functions.zsh"
[[ -f "$ZDOTDIR/history.zsh" ]] && source "$ZDOTDIR/history.zsh"
[[ -f "$ZDOTDIR/keybinds.zsh" ]] && source "$ZDOTDIR/keybinds.zsh"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
