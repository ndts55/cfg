# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Config Setup
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

# Environment Variables and PATH
pathmunge() {
  if [[ -d "$1" ]]; then
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
  fi
}

export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nvim
export GOPATH=$HOME/.go
export TERM=tmux-256color

pathmunge "$GOPATH/bin"
pathmunge "$HOME/.cargo/bin"
pathmunge "$HOME/.local/bin"
pathmunge "$HOME/.local/share/TeXLive/2025/bin/x86_64-linux" after
pathmunge "$HOME/Desktop/NVIDIA-Nsight-Compute-2025.2" after

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
