export PATH=$HOME/bin:/usr/local/bin:$HOME/go/bin:$HOME/.pyenv/shims/:$PATH:

export ZSH="/Users/vitune/.oh-my-zsh"

ZSH_THEME="agnoster"

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"

plugins=(git zsh-syntax-highlighting tmux)

source $ZSH/oh-my-zsh.sh

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

alias upd="brew update && brew upgrade && brew upgrade --cask && brew cleanup"
alias t="tmux"
alias n="nvim"
alias k="kubectl"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)
