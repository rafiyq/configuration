{
  programs.fish = {
    enable = true;
    shellAliases = {
      gss = "git status --short";
      gst = "git status";
      ga = "git add";
      gaa = "git add --all";
      gcmsg = "git commit --message";
      gcam = "git commit --all --message";
      gp = "git push";
      gd = "git diff";
      gc = "git clone --recurse-submodules";
    };
    interactiveShellInit = ''
      function border --on-event fish_postexec
          string repeat --count $COLUMNS ⸻
      end
      set -U fish_greeting
    '';
  };

  programs.git = {
    enable = true;
    config = {
      core.editor = "hx";
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
    presets = [ "plain-text-symbols" ];
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[❯](bold dimmed green)[❯](bold green)[❯](bold bright-green)";
        error_symbol = "[❯](bold dimmed red)[❯](bold red)[❯](bold bright-red)";
      };
    };
  };

  programs.tmux = {
    enable = true;
    baseIndex = 1;
    escapeTime = 0;
    extraConfig = ''
      set -g mouse on
      set-option -g renumber-windows on

      # Status Bar
      set -g status-style bg=default
      set -g status-left ' '
      
      set-window-option -g window-status-current-format "\
        #[fg=white, bg=green] #{b:pane_current_path}\
        #[fg=green, bg=white] #I \
      "
      set-window-option -g window-status-format "\
        #[fg=grey, bg=colour245] #{b:pane_current_path}\
        #[fg=colour245, bg=grey] #I \
      "
      set -g status-right "#[fg=white,bg=black] #W [#S] "
    '';
  };
}
