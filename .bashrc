# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Config Setup
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
# config config --local status.showUntrackedFiles no

# Environment Variables and PATH
pathmunge() {
  case ":${PATH}:" in
  *:"$1":*) ;;
  *)
    if [ "$2" = "after" ]; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
    ;;
  esac
}

export GOPATH=$HOME/.go
pathmunge "$GOPATH/bin"

export QT_QPA_PLATFORMTHEME="qt5ct"

export EDITOR=/usr/bin/nvim

pathmunge "$HOME/.cargo/bin"
pathmunge "$HOME/.local/share/TeXLive/2025/bin/x86_64-linux"

# Aliases
## LS
unalias ls
alias ls="eza"
alias la="eza -a"
alias ll="eza -l"
## Git
alias gstat="git status -s"
alias gdiff="git diff"
alias gaa="git add -A"
alias gcm="git commit -m"
alias gp="git push"
alias gb="git branch"
alias gch="git checkout"
alias gchb="git checkout -b"
## Misc
alias nano="nvim"
alias vim="nvim"

# Functions
gpa() {
  gaa
  gcm $@
  gp
}

# Completions
source /usr/share/bash-completion/completions/git
