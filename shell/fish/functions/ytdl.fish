function ytdl
    set ytdl "yt-dlp"
    switch $argv[1]
        case --best
            echo "Download Best Format"
            $ytdl \
                -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
                --embed-thumbnail \
                --add-metadata \
                $argv[2]
        case --music
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
                $argv[2]
        case --top
            echo "Download top format"
            $ytdl \
                -f 'bestvideo+bestaudio' \
                --embed-thumbnail \
                --add-metadata \
                $argv[2]
        case --only-sub
            echo "Download subtitle"
            $ytdl \
                --write-auto-subs \
                --write-subs \
                --sub-langs en \
                --convert-subtitles srt \
                --skip-download \
                $argv[2]
        case --only-thumbnail
            $ytdl \
                --write-thumbnail \
                --skip-download \
                $argv[2]
        case '*'
            $ytdl $argv[1..-1]
    end
end
