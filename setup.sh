#!/bin/bash

# Configuration
HERE="$(cd "$(dirname "$0")"; pwd -P)"
CONFIG_DIR="$HOME/.config"
BIN_DIR="$HOME/.local/bin"

# Helper for linking
link_item() {
    local src="$HERE/$1"
    local parent="$2"
    local name="${3:-$(basename "$1")}"
    local dst="$parent/$name"

    mkdir -p "$parent"
    
    if [ ! -e "$src" ]; then
        echo "Warning: Source '$src' does not exist. Skipping."
        return
    fi

    # Check if destination exists (file, directory, or symlink)
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        # If it's a symlink already pointing to the correct source, skip
        if [ "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]; then
            echo "Already correctly linked: $dst"
            return
        fi

        printf "Destination %s already exists. Overwrite? (y/N): " "$dst"
        read -r confirm
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo "Skipping: $dst"
            return
        fi
        # Remove the existing item to ensure a clean link
        rm -rf "$dst"
    fi

    echo "Linking: $1 -> $dst"
    ln -sfn "$src" "$dst"
}

# --- Module Definitions ---

# Editors
setup_nvim()     { link_item "editor/nvim" "$CONFIG_DIR"; }
setup_helix()    { link_item "editor/helix" "$CONFIG_DIR"; }
setup_sublime()  { 
    local sublime_user="$CONFIG_DIR/sublime-text/Packages/User"
    mkdir -p "$sublime_user"
    ln -sfni "$HERE/editor/sublime-text/"* "$sublime_user/"
}

# Base CLI
setup_git()      { link_item "git" "$CONFIG_DIR"; }
setup_tmux()     { link_item "tmux" "$CONFIG_DIR"; }

# Shells
setup_bash()     { link_item "shell/bash" "$CONFIG_DIR" "bash"; }
setup_zsh()      { link_item "shell/zsh" "$CONFIG_DIR" "zsh"; }
setup_fish()     { link_item "shell/fish" "$CONFIG_DIR" "fish"; }
setup_starship() { link_item "shell/starship/starship.toml" "$CONFIG_DIR"; }

# Sway / Desktop
setup_sway_full() {
    echo "Setting up Sway environment..."
    for dir in "$HERE/sway"/*/; do
        if [ -d "$dir" ]; then
            link_item "sway/$(basename "$dir")" "$CONFIG_DIR"
        fi
    done
}

# Scripts
setup_scripts() {
    link_item "script/sh" "$BIN_DIR"
    link_item "script/python" "$BIN_DIR"
    link_item "script/nautilus" "$BIN_DIR"
    link_item "script/powershell" "$BIN_DIR"
}

# --- Menu Logic ---

# Array of menu items: "Label|Category|Function"
MENU_ITEMS=(
    "NVIM|Editor|setup_nvim"
    "HELIX|Editor|setup_helix"
    "SUBLIME|Editor|setup_sublime"
    "GIT|Base|setup_git"
    "TMUX|Base|setup_tmux"
    "BASH|Shell|setup_bash"
    "ZSH|Shell|setup_zsh"
    "FISH|Shell|setup_fish"
    "STARSHIP|Shell|setup_starship"
    "SWAY|Desktop|setup_sway_full"
    "SCRIPTS|System|setup_scripts"
)

show_menu() {
    echo "=== Setup Menu ==="
    local i=1
    for item in "${MENU_ITEMS[@]}"; do
        IFS='|' read -r label category func <<< "$item"
        # Print number, label, and category (aligned to column 30)
        printf "%2d) %-25s [%s]\n" "$i" "$label" "$category"
        ((i++))
    done
    echo ""
    echo "Enter numbers separated by space (e.g., '1 2 4'), 'all', or 'q' to quit."
}

# Run the menu
show_menu
read -p "Selection: " input

if [[ "$input" == "q" ]]; then
    echo "Exiting."
    exit 0
elif [[ "$input" == "all" ]]; then
    echo "Installing all modules..."
    for item in "${MENU_ITEMS[@]}"; do
        IFS='|' read -r label category func <<< "$item"
        $func
    done
else
    # Process numeric selections
    for choice in $input; do
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "${#MENU_ITEMS[@]}" ]; then
            IFS='|' read -r label category func <<< "${MENU_ITEMS[$((choice-1))]}"
            $func
        else
            echo "Invalid selection: $choice"
        fi
    done
fi
