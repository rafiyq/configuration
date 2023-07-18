function vscode
    set vscode_bin /usr/bin/code
    if test (count $argv) -le 1
        echo "Opening VSCode in current directory with $argv[1]'s profile"
        $vscode_bin . --profile $argv[1]
    else
        echo "Opening VSCode with $argv[1]'s profile"
        $vscode_bin $argv[2] --profile $argv[1]
    end
end
