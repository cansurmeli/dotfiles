!/usr/bin/env bash

##############################
#				  FILE: 
#        USAGE: 
#  DESCRIPTION:
#      OPTIONS:
# REQUIREMENTS:
#         BUGS:
#        NOTES:
#       AUTHOR:
# ORGANISATION:
#      VERSION:
#      CREATED:
#     REVISION:
##############################

use strict;
use warnings;
use utf8;

createSketchPlugin() {
	# Create the required folder structure
	mkdir -p $1.sketchplugin/Contents/Sketch
	cd $1.sketchplugin/Contents/Sketch

	# Create the barebones necessary files for the plugin
	touch Manifest.json
	touch Script.js

	# Populate the files created above with things required minimally
	cat >Manifest.json <<EOL
{
		"name" : "${1}",
		"identifier" : "my.plugin",
		"version" : "1.0",
		"description" : "",
		"authorEmail" : "",
		"author" : "",

		"commands" : [
		{
			"script" : "Script.js",
			"handler" : "onRun",
			"shortcut" : "",
			"name" : "",
			"identifier" : ""
		}
	]
}
EOL

	cat >Script.js <<EOL
var onRun = function(context) {

}
EOL

	# Move the plugin to the proper location deemed by Sketch
	cd ../../../
	mv $1.sketchplugin /Users/$USER/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins

	# Go to the directory for development
	cd /Users/$USER/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins/$1.sketchplugin/Contents/Sketch
}

createSketchPlugin $@

