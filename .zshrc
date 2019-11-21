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

export PATH="~/.bin:$PATH"

# GENERAL
source ~/.aliases
source ~/.aliases_mac
source ~/.functions
source ~/.functions_apple_dev
source ~/.functions_mac
source ~/.functions_web_dev

# PERSONAL

# IMPORTANT
# The default keybinding gets overriden.
# So that Ctrl-A and such does not work.
# The following solves it
# https://superuser.com/questions/523564/emacs-keybindings-in-zsh-not-working-ctrl-a-ctrl-e
bindkey -e

# NVM CONFIGURATION
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
