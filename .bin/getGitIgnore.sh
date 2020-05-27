#!/usr/local/bin/bash

#		The following function requires at least Bash 4.0.

getGitIgnore() {
	touch .gitignore

	# Add some comments to the file for basic readability
	echo "#########" >> .gitignore
	echo "# DEFAULTS" >> .gitignore
	echo "#########" >> .gitignore

	# Retrieve the basic gitignore file
	wget --quiet https://gist.githubusercontent.com/octocat/9257657/raw/3f9569e65df83a7b328b39a091f0ce9c6efc6429/.gitignore --output-document ->> .gitignore
	echo "SUCCESS: Retrieved the general gitignore file."
	echo ""

	# If a file type has been asked, append it to the basic gitignore file above
	if [ -n "$1" ]; then
		# Concatenate the file type to the base URL
		baseURL="https://raw.githubusercontent.com/github/gitignore/master/"

		for lang in "$@"
		do
			# Append two empty lines to the already retrieved .gitignore file
			# So that the additonal files get appended properly
			echo "" >> .gitignore
			echo "" >> .gitignore

			# just in case, lowercase all letters
			lang=${lang,,}

			# capitalise the first letter because they're
			# stored like that
			lang=${lang^}


			# Compose the full URL
			langURL="$baseURL$lang.gitignore"

			# Retrieve the additional file and append it to the default one
			if wget --quiet "$langURL" --output-document ."$lang".txt ; then
				echo "SUCCESS: Retrieved the gitignore file for the \`$lang\` language."
				echo ""

				echo "#########" >> .gitignore
				echo "# ${lang}" >> .gitignore
				echo "#########" >> .gitignore

				cat .$lang.txt >> .gitignore
			else
				echo "ERROR: Unfortunately, the gitignore file for the \`$lang\` language could be retrieved for some reason. Please check your options and try again."
			fi

			rm .$lang.txt
		done
	fi
}

getGitIgnore $@
