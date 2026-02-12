## LS
if command -v eza >/dev/null 2>&1; then
  unalias ls
  alias ls="eza"
  alias la="ls -la"
  alias ll="ls -l"
fi
## EDITOR
alias vim="env -u NVIM_LISTEN_ADDRESS nvim"
