export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:$PATH:

export ZSH="/Users/vitune/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias upd="brew update && brew upgrade && brew upgrade --cask && brew cleanup"
alias t="tmux"
alias n="nvim"
alias k="kubectl"

[[ $TMUX = "" ]] && export TERM="xterm-256color"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
