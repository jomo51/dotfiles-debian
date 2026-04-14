# ~/.config/shell/aliases.zsh

# Safer file operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# ls family
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza -lah --icons --group-directories-first'
  alias la='eza -a --icons --group-directories-first'
  alias lt='eza --tree --icons --level=2 --group-directories-first'
  alias tree='eza --tree --icons'
else
  alias ll='ls -lah'
  alias la='ls -A'
fi

# Editors
alias vi='nvim'
alias vim='nvim'

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --online --graph --decorate'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'

# Utility
if command -v batcat >/dev/null 2>&1; then
  alias cat='batcat --paging=never'
elif command -v bat >/dev/null 2>&1; then
  alias cat='bat --paging=never'
fi

