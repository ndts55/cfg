# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

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
export NVIM_LISTEN_ADDRESS=$HOME/.nvimsocket

pathmunge "$GOPATH/bin"
pathmunge "$HOME/.cargo/bin"
pathmunge "$HOME/.local/bin"
pathmunge "$HOME/.local/share/TeXLive/2025/bin/x86_64-linux" after
pathmunge "$HOME/Desktop/NVIDIA-Nsight-Compute-2025.2" after
export PATH

# Aliases
## LS
unalias ls
alias ls="eza"

# Completions
source /usr/share/bash-completion/completions/git

# Prompt
source "$HOME"/.git-prompt.sh

export PS1='\[\e[1m\]\[\e[32m\]\u@\h\[\e[00m\]\[\e[1m\]:\[\e[32m\]\w \[\e[91m\]$(__git_ps1 "(%s) ")\[\e[00m\]$ '
