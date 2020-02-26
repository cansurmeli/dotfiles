#!/bin/sh

cp ~/.dotfiles/.aliases .
cp ~/.dotfiles/.aliases_mac .
cp ~/.dotfiles/.aliases_rpi .
cp ~/.dotfiles/.functions .
cp ~/.dotfiles/.functions_apple_dev .
cp ~/.dotfiles/.functions_mac .
cp ~/.dotfiles/.functions_rpi .
cp ~/.dotfiles/.functions_web_dev .
cp ~/.dotfiles/.vimrc .
cp ~/.dotfiles/.zshrc .

# upgrade the vim skeletons
cp ~/.vim/skeletons/* skeletons/*

# remove the sensitive files being sourced
sed -i '' -e '/directories/d' .zshrc
sed -i '' -e '/confidential/d' .zshrc
