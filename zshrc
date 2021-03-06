[ -z "$PS1" ] && return

export PYTHONDONTWRITEBYTECODE=1

# Path to your oh-my-zsh configuration.
ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ -z "$TERM_PROGRAM" ]] || [[ "$TERM" == xterm-color256 ]]; then
    ZSH_THEME="arrow"
fi

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

export LSCOLORS=GxFxCxDxBxegedabagaced

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
plugins=(git osx docker aws fabric ssh-agent sudo)

source $ZSH/oh-my-zsh.sh


export GOPATH=${HOME}/src/_go

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:${GOPATH}/bin:${HOME}/.dotfiles/bin

if [[ -e "/usr/local/bin/vim" ]]; then
    export EDITOR=/usr/local/bin/vim
else
    export EDITOR=$(which vim)
fi

eval "`pip3 completion --zsh`"

#export WORKON_HOME=~/.envs/
#. /usr/local/bin/virtualenvwrapper.sh

if [[ -e /Users/${USER}/.iterm2_shell_integration.zsh ]]; then
    source /Users/${USER}/.iterm2_shell_integration.zsh
fi

for FILENAME in ${HOME}/.dotfiles/aliases ${HOME}/.dotfiles/func; do
    if [[ -e ${FILENAME} ]]; then
        source ${FILENAME}
    fi
done

if [[ -e ~/.zshrc.local ]]; then
    source ~/.zshrc.local
fi

export LSCOLORS=GxFxCxDxBxegedabagaced

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
