#!/bin/sh

# Ask the user for the platform
echo "Which platform:"
echo "1 - Linux"
echo "2 - macOS"
echo "3 - rPi"

# Retrieve the user input
read userPlatform

# Common files every platform makes use of
cp .aliases ~/
cp .functions ~/
cp .vimrc ~/
cp .functions_web_dev ~/

# Transfer the Vim snippets
mkdir ~/.vim
cp -R skeletons ~/.vim

# Linux
if [ "$userPlatform" -eq 1 ]
then
	# Remove the sourcing of unnecessary files
	sed -i '' -e '/aliases_mac/d' .zshrc
	sed -i '' -e '/aliases_rpi/d' .zshrc
	sed -i '' -e '/functions_apple_dev/d' .zshrc
	sed -i '' -e '/functions_mac/d' .zshrc
	sed -i '' -e '/functions_rpi/d' .zshrc
# macOS
elif [ "$userPlatform" -eq 2 ]
then
	# Additional files needed
	cp .aliases_mac ~/
	cp .functions_apple_dev ~/
	cp .functions_mac ~/

	# Remove the sourcing of unnecessary files
	sed -i '' -e '/aliases_rpi/d' .zshrc
	sed -i '' -e '/functions_rpi/d' .zshrc
# rPi
elif [ "$userPlatform" -eq 3 ]
then
	# Additional files needed
	cp .aliases_rpi ~/
	cp .functions_rpi ~/

	# Remove the sourcing of unnecessary files
	sed -i '' -e '/aliases_mac/d' .zshrc
	sed -i '' -e '/functions_apple_dev/d' .zshrc
	sed -i '' -e '/functions_mac/d' .zshrc
	sed -i '' -e '/web_dev/d' .zshrc
else
	echo "Wrong input! Run the script again."
	exit 1
fi

cp .zshrc ~/
