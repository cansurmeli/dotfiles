#!/bin/sh

# Copy everything required
cp ~/.dotfiles/.aliases .
cp ~/.dotfiles/.aliases_mac .
cp ~/.dotfiles/.aliases_rpi .
cp ~/.dotfiles/.functions .
cp ~/.dotfiles/.functions_apple_dev .
cp ~/.dotfiles/.functions_mac .
cp ~/.dotfiles/.functions_rpi .
cp ~/.dotfiles/.functions_web_dev .
cp ~/.zpreztorc .
cp ~/.zshrc .
cp -R ~/.bin .

# Remove the sensitive files being sourced
sed -i '' -e '/directories/d' .zshrc
sed -i '' -e '/confidential/d' .zshrc
