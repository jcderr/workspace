[ -z "$PS1" ] && return

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ -z "$TERM_PROGRAM" ]]; then
    ZSH_THEME="arrow"
fi

function powerline_precmd() {
    if [[ -n "$TERM_PROGRAM" ]]; then
        export PS1="$(~/.devenv/powerline-shell/powerline-shell.py $? --colorize-hostname --shell zsh 2> /dev/null)"
    fi
}

function install_powerline_precmd() {
    for s in "${precmd_functions[@]}"; do
        if [ "$s" = "powerline_precmd" ]; then
            return
        fi
    done

    precmd_functions+=(powerline_precmd)
}

install_powerline_precmd

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx docker)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

function yesterworkday() 
{ 
    if [[ "1" == "$(date +%u)" ]]; then 
        echo "last friday"
    else
        echo "yesterday"
    fi
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH:~/src/djed/bin"
