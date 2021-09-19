# completion
autoload -U compinit
compinit

export PATH="/usr/local/sbin:$PATH"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
else
    print "~/.zshrc.local is not found."
fi

# starship init scrips
export STARSHIP_CONFIG=~/.starship/config.toml
eval "$(starship init zsh)"

# zplug configuration
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

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
