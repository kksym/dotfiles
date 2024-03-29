
ZSH=$HOME/.oh-my-zsh

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/kyle/.cabal/bin:/home/kyle/.gem/ruby/1.9.1/bin

export EDITOR='vim'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

zstyle :compinstall filename '/home/kyle/.zshrc'

autoload -Uz compinit
compinit

PS1="[%n@%m %1~] "

alias ls='ls --color=auto'
alias csi='rlwrap csi'
alias sbcl='rlwrap sbcl'
#alias emacs='emacs -nw'
alias astyle='astyle -A1sCSNLwYpHxdk1W1'
alias maxima='rlwrap maxima'
alias mit-scheme='rlwrap mit-scheme'

export BROWSER=firefox
export GBDKDIR=/opt/gbdk/

function share() {
    cat $1 | haste | xsel
}

