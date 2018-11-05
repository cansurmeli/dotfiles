#!/bin/sh

echo "Which platform:"
echo "1 - Linux"
echo "2 - macOS"
echo "3 - rPi"

read userPlatform

if [ "$userPlatform" -eq 1 ]
then
	cp .aliases ~/
	cp .functions ~/
	cp .vimrc ~/

	sed -i '' -e '/aliases_mac/d' .zshrc
	sed -i '' -e '/aliases_rpi/d' .zshrc
	sed -i '' -e '/functions_apple_dev/d' .zshrc
	sed -i '' -e '/functions_mac/d' .zshrc
	sed -i '' -e '/functions_rpi/d' .zshrc
	
	cp .zshrc ~/
elif [ "$userPlatform" -eq 2 ]
then
	cp .aliases ~/
	cp .aliases_mac ~/
	cp .functions ~/
	cp .functions_mac ~/
	cp .vimrc ~/

	sed -i '' -e '/aliases_rpi/d' .zshrc
	sed -i '' -e '/functions_rpi/d' .zshrc
	
	cp .zshrc ~/
elif [ "$userPlatform" -eq 3 ]
then
	cp .aliases ~/
	cp .aliases_rpi ~/
	cp .functions ~/
	cp .functions_rpi ~/
	cp .vimrc ~/

	sed -i '' -e '/aliases_mac/d' .zshrc
	sed -i '' -e '/functions_apple_dev/d' .zshrc
	sed -i '' -e '/functions_mac/d' .zshrc
	
	cp .zshrc ~/
else
	echo "Wrong input! Run the script again."
fi
