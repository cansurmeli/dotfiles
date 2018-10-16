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

# Source my customisations
source ~/.aliases
source ~/.aliases_mac
source ~/.aliases_rpi
source ~/.functions
source ~/.functions_mac
source ~/.functions_rpi

export PATH="$HOME/.fastlane/bin:$PATH"

# IMPORTANT
# The default keybinding gets overriden.
# So that Ctrl-A and such does not work.
# The following solves it
# https://superuser.com/questions/523564/emacs-keybindings-in-zsh-not-working-ctrl-a-ctrl-e
bindkey -e
