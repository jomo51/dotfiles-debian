# ~/.config/shell/function.zsh

mkcd() {
  mkdir -p -- "$1" && cd -- "$1"
}
