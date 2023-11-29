function ytdl
    set ytdl "yt-dlp"
    set youtube_url $argv[-1]
    set unrecognized_command ''

    for arg in $argv
        switch $arg
            case --best -b
                echo "Download Best Format from $youtube_url"
                $ytdl \
                    -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
                    --embed-thumbnail \
                    --add-metadata \
                    $youtube_url
            case --music -m
                echo "Download as music"
                $ytdl \
                    -o %\(track\)s\ -\ %\(artist\)s.%\(ext\)s \
                    -f bestaudio \
                    --extract-audio \
                    --audio-format mp3 \
                    --embed-thumbnail \
                    --add-metadata \
                    --audio-quality 0 \
                    --metadata-from-title %\(track\)s\ -\ %\(artist\)s \
                    $youtube_url
            case --top -t
                echo "Download top format"
                $ytdl \
                    -f 'bestvideo+bestaudio' \
                    --embed-thumbnail \
                    --add-metadata \
                    $youtube_url
            case --only-sub -s
                echo "Download subtitle"
                $ytdl \
                    --write-auto-subs \
                    --write-subs \
                    --sub-langs en \
                    --convert-subtitles srt \
                    --skip-download \
                    $youtube_url
            case --only-thumbnail --thumb
                $ytdl \
                    --write-thumbnail \
                    --skip-download \
                    $youtube_url
            case '*'
                if test -z (string match -r -- "https?:\/\/" $arg)
                    set unrecognized_command $unrecognized_command $arg
                end
        end
    end

    if test -n $unrecognized_command
        $ytdl $unrecognized_command[2..-1] $youtube_url
    end
end
