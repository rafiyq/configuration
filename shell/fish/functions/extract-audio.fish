function extract-audio --description 'Extract audio from video file using FFMPEG'
    set video_file $argv[1]
    set audio_file (path change-extension .aac $video_file)

    ffmpeg -i $video_file -vn -acodec copy $audio_file
end
