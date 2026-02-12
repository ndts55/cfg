source "$HOME"/.git-prompt.sh

export PS1='\[\e[1m\]\[\e[32m\]\u@\h\[\e[00m\]\[\e[1m\]:\[\e[32m\]\w \[\e[91m\]$(__git_ps1 "(%s) ")\[\e[00m\]$ '
