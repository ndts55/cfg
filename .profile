pathmunge () {
  if ! echo $PATH | /bin/grep -E -q "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH=$PATH:$1
    else
      PATH=$1:$PATH
    fi
  fi
}

export GOPATH=$HOME/.go
pathmunge "$GOPATH/bin"

export QT_QPA_PLATFORMTHEME="qt5ct"

export EDITOR=/usr/bin/nvim

pathmunge "$HOME/.cargo/bin"
pathmunge "$HOME/.local/share/TeXLive/2025/bin/x86_64-linux"

alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"
config config --local status.showUntrackedFiles no

