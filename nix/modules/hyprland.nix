{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER";
    "$menu" = "wofi --show drun"
    "$terminal" = "foot";
    bind =
      [
        "$mainMod, R, exec, $menu"
        ", Print, exec, grimblast copy area"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      );
  };

  programs.alacritty = {
    enable = true;
    settings = {
      shell = {
        program = "tmux";
        args = ["new-session", "-A", "-D", "-s", "main"];
    };
  };

  programs.foot.enable = true;
  programs.wofi.enable = true;
}