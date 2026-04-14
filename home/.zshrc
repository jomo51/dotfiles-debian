[[ $- != *i* ]] && return

# XDG_CONFIG

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Load shell modules
for file in \
  "$XDG_CONFIG_HOME/shell/exports.zsh" \
  "$XDG_CONFIG_HOME/shell/aliases.zsh" \
  "$XDG_CONFIG_HOME/shell/functions.zsh" \
  "$XDG_CONFIG_HOME/shell/completion.zsh" \
  "$XDG_CONFIG_HOME/shell/plugins.zsh"
do
  [[ -r "$file" ]] && source "$file"
done

# Prompt
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# auto attach tmux on SSH
#if [[ -n "$SSH_CONNECTION" ]] && [[ -z "$TMUX" ]] && [[ -o interactive ]]; then
#  exec tmux attach -t main 2>/dev/null || exec tmux new -s main
#fi
