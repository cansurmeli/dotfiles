#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="~/.bin:$PATH"

# GENERAL
source ~/.dotfiles/.aliases
source ~/.dotfiles/.aliases_mac
source ~/.dotfiles/.functions
source ~/.dotfiles/.functions_apple_dev
source ~/.dotfiles/.functions_mac
source ~/.dotfiles/.functions_web_dev

# PERSONAL

# Ditch Nano in place of Vim when editing cron jobs
export VISUAL=vim

# IMPORTANT
# The default keybinding gets overriden.
# So that Ctrl-A and such does not work.
# The following solves it
# https://superuser.com/questions/523564/emacs-keybindings-in-zsh-not-working-ctrl-a-ctrl-e
bindkey -e

# NVM CONFIGURATION
#export NVM_DIR="$HOME/.nvm"
#[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
#[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
#source $(brew --prefix nvm)/nvm.sh

# DOCKER
export DOCKER_HIDE_LEGACY_COMMANDS=true
# The completion engine for Docker https://docs.docker.com/compose/completion/has to be included in $fpath
fpath=(~/.zsh/completion $fpath)
# Docker completion engine also requires `compinit` is loaded
autoload -Uz compinit && compinit -i
