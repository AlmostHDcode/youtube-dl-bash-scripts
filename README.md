# youtube-dl-bash-scripts
custom bash scripts for youtube-dl
updated to using a fork of youtube-dl called yt-dlp, it fixes the issue of slow downloads
original line using standard youtube-dl still exists but is commented out

## youtube-dl-audio.sh
  ffmpeg may be required depending on what audio format you choose
  gives user a selection of 3 audio formats: mp3, ogg, opus
  user selects a format and then enters url
  after download is done it loops back to select audio format and url
  user can quit at any time by either entering N or Q in the audio format or url entering part

## youtube-dl-video.sh
  user enters url and it will download the best premerged audio and video format that is available
  tried to make it so user could select specific resoltion or limit the resolution (for example download best up to 1080p) but I kept getting errors
  continues to loop allowing user to download multiple videos until they decide to quit out of the loop
