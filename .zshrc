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

# My Own Dotfiles
source ~/.dotfiles/.aliases
source ~/.dotfiles/.aliases_mac
source ~/.dotfiles/.functions
source ~/.dotfiles/.functions_apple_dev
source ~/.dotfiles/.functions_mac
source ~/.dotfiles/.functions_web_dev

# Confidential stuff
source /Users/can/.confidential/directories
source /Users/can/.confidential/functions_confidential
