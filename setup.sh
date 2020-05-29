#!/bin/sh

# Ask the user for the platform
echo "Which platform:"
echo "1 - Linux"
echo "2 - macOS"
echo "3 - rPi"

# Retrieve the user input
read userPlatform

# GENERAL OPERATIONS
# Contain the dotfiles in their own environment for easy-management
mkdir ~/.dotfiles

# Common files every platform makes use of
cp .aliases ~/.dotfiles/
cp .functions ~/.dotfiles/
cp .vimrc ~/.dotfiles/
cp .functions_web_dev ~/.dotfiles/

# Transfer the Vim snippets
mkdir ~/.vim
cp -R vim ~/.vim/

# Other Vim operations
mkdir ~/.vim/backup
mkdir ~/.vim/swp

# PLATFORM SPECIFIC OPERATIONS
# Linux
if [ "$userPlatform" -eq 1 ]
then
	# Remove the sourcing of unnecessary files
	sed -i '' -e '/.dotfiles/aliases_mac/d' .zshrc
	sed -i '' -e '/.dotfiles/aliases_rpi/d' .zshrc
	sed -i '' -e '/.dotfiles/functions_apple_dev/d' .zshrc
	sed -i '' -e '/.dotfiles/functions_mac/d' .zshrc
	sed -i '' -e '/.dotfiles/functions_rpi/d' .zshrc
# macOS
elif [ "$userPlatform" -eq 2 ]
then
	# Additional files needed
	cp .aliases_mac ~/.dotfiles/
	cp .functions_apple_dev ~/.dotfiles/
	cp .functions_mac ~/.dotfiles/

	# Remove the sourcing of unnecessary files
	sed -i '' -e '/.dotfiles/aliases_rpi/d' .zshrc
	sed -i '' -e '/.dotfiles/functions_rpi/d' .zshrc
# rPi
elif [ "$userPlatform" -eq 3 ]
then
	# Additional files needed
	cp .aliases_rpi ~/.dotfiles/
	cp .functions_rpi ~/.dotfiles/

	# Remove the sourcing of unnecessary files
	sed -i '' -e '/.dotfiles/aliases_mac/d' .zshrc
	sed -i '' -e '/.dotfiles/functions_apple_dev/d' .zshrc
	sed -i '' -e '/.dotfiles/functions_mac/d' .zshrc
	sed -i '' -e '/.dotfiles/web_dev/d' .zshrc
else
	echo "Wrong input! Run the script again."
	exit 1
fi

cp .zshrc ~/
