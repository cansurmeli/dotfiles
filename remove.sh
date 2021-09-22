#!/bin/sh

# Ask the user for the platform
echo "Are you sure about removing the dotfiles?"
echo "1 - yes"
echo "2 - no"

# Retrieve the user input
read answer

# Yes
if [ "$answer" -eq 1 ]
then
	# Remove the dotfiles
	rm -rf ~/.dotfiles
# No
elif [ "$userPlatform" -eq 3 ]
then
	echo "Nothing got deleted."
else
	echo "Wrong input! Run the script again."
	exit 1
fi
