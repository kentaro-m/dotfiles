export PATH="/usr/local/opt/ncurses/bin:$PATH"

# nodebrew configuration
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rust configuration
export PATH=$HOME/.cargo/bin:$PATH

# zplug configuration
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# ghq alias
alias g='cd $(ghq root)/$(ghq list | peco)'
