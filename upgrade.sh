#!/bin/sh

cp ~/.aliases .
cp ~/.aliases_mac .
cp ~/.aliases_rpi .
cp ~/.functions .
cp ~/.functions_mac .
cp ~/.functions_rpi .
cp ~/.vimrc .
cp ~/.zshrc .


sed -i '' -e '/directories/d' .zshrc
sed -i '' -e '/confidential/d' .zshrc
