export PATH=$HOME/bin:$PATH:/usr/local/sbin:/usr/local/bin:$HOME/go/bin:$PATH:$HOME/.cargo/bin:${KREW_ROOT:-$HOME/.krew}/bin:$PATH

export ZSH="/Users/victor.suzdalev/.oh-my-zsh"

export EDITOR=nvim

ZSH_THEME="gallois"

ZSH_TMUX_AUTOSTART="true"
ZSH_TMUX_AUTOQUIT="false"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions tmux)

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

source $ZSH/oh-my-zsh.sh

alias upd="brew update && brew upgrade && brew upgrade --cask && brew cleanup"
alias t="tmux"
alias n="nvim"
alias k="kubectl"
alias h="helm"
alias kgetall="kubectl get namespace,replicaset,secret,nodes,job,daemonset,statefulset,ingress,configmap,pv,pvc,service,serviceaccounts,deployment,pod"
alias rustscan='docker run -it --rm --name rustscan cmnatic/rustscan:debian-buster rustscan'

# fzf search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# kubernetes prompt helper
source /usr/local/opt/kube-ps1/share/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

# kubectl autocompletion
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# syntax highlighting
source /Users/victor.suzdalev/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

