# completion
autoload -U compinit
compinit

export PATH="/usr/local/sbin:$PATH"

# starship init scrips
export STARSHIP_CONFIG=~/.starship/config.toml
eval "$(starship init zsh)"

# nodebrew configuration
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rust configuration
export PATH=$HOME/.cargo/bin:$PATH

# python configuration
export PATH=/usr/local/opt/python@3.9/libexec/bin:$PATH

# openjdk
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/usr/local/opt/openjdk@11/include"

# zplug configuration
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# kubectl completion
source <(kubectl completion zsh)

# direnv setup
eval "$(direnv hook zsh)"

zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug mafredri/zsh-async, from:github

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# ghq alias
alias g='cd $(ghq root)/$(ghq list | peco)'
