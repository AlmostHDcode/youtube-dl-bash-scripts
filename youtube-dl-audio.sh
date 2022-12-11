#!/bin/bash

#Author: AlmostHDcode

# default to Y, loop stops when it gets changed to N
go="Y"
ff="/usr/bin/ffmpeg" #location of ffmpeg
#backslashes are needed to escape the '()' characters to make them be able to work as a template in this command
destLoc="/destination/path/%\(title\)s.%\(ext\)s" #download location, using template to save file as title_of_file.audio_extension

# continue until quit condition is met
while [ "$go" != "N" ]; do
	
	audioNum=0
	audioFormat=""
	
	#Audio Format Select Menu
	echo "Youtube-dl, download audio files"
	echo "__________________"
	echo "Please Select Audio Format"
	echo "1.) MP3"
	echo "2.) OGG Vorbis"
	echo "3.) OGG Opus"
	echo "Enter Q to Quit"
	echo "__________________"
	
	#user input select audio format
	read -rp "Enter Number: " audioNum
	
	#give value to audioFormat
	
	if [ "$audioNum" = 1 ]; then
		audioFormat="mp3"
	fi
	
	if [ "$audioNum" = 2 ]; then
		audioFormat="vorbis"
	fi
	
	if [ "$audioNum" = 3 ]; then
		audioFormat="opus"
	fi

	#show user what they selected
	echo "$audioFormat Selected"
	echo "_____________________"
	
	#quit condition
	if [ "$audioNum"  = "Q" ] || [ "$audioNum" = 0 ]; then
		go="N"
		echo "Exiting Youtube-dl ....."
        echo "Goodbye"
        continue
	fi
	
	#user input enter url
	read -rp "Enter url OR Enter 'N' To Exit: " url

	#quit condition
	if [ "$url" == "N" ]; then
	  go="N"
	  echo "Exiting Youtube-dl ....."
    echo "Goodbye"
    continue
	else # run youtube-dl command, using ffmpeg to convert to different format if needed
  
    #old version using the standard youtube-dl
	  #dl_string="youtube-dl -x --audio-format $audioFormat --audio-quality 0 -o $destLoc --write-thumbnail --ffmpeg $ff $url"
    
    #new version using fork of youtube-dl, yt-dlp fixes issue with slow downloads
		dl_string="yt-dlp -x --audio-format $audioFormat --audio-quality 0 -o $destLoc --write-thumbnail --ffmpeg $ff $url"
		echo "$dl_string"
	 	eval "$dl_string"
	fi
done
