#!/bin/bash

#Author: AlmostHDcode

#default to Y, loop stops when it gets changed to Q
go="Y"
#backslashes are needed to escape the '()' characters to make them be able to work as a template in this command
destLoc="/destination/path/%\(title\)s.%\(ext\)s" #download location, using template to save file as title_of_file.video_extension

# continue until quit condition is met
while [ "$go" != "Q" ]; do
	
	echo "Youtube-dl, download video files"
	echo "__________________________________"
	#user input enter url
	read -rp "Enter url OR Enter 'Q' To Exit: " url

	#quit condition
	if [ "$url" == "Q" ]; then
		go="Q"
		echo "Exiting Youtube-dl ....."
    echo "Goodbye"
    continue
	else
    #old version using the standard youtube-dl
		#dl_string="youtube-dl -f best -o $destLoc $url"
    
    #new version using fork of youtube-dl, yt-dlp fixes issue with slow downloads
		dl_string="yt-dlp -f b -o $destLoc $url"
		echo "$dl_string"
	 	eval "$dl_string"
	fi
done
