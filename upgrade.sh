#!/bin/sh

cp ~/.aliases .
cp ~/.aliases_mac .
cp ~/.aliases_rpi .
cp ~/.functions .
cp ~/.functions_apple_dev .
cp ~/.functions_ffmpeg .
cp ~/.functions_mac .
cp ~/.functions_rpi .
cp ~/.functions_web_dev .
cp ~/.vimrc .
cp ~/.zshrc .


sed -i '' -e '/directories/d' .zshrc
sed -i '' -e '/confidential/d' .zshrc
