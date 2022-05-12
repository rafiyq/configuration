{ config, pkgs, ... }:

{
  home.username = "rafiyq";
  home.homeDirectory = "/home/rafiyq";
  home.packages = [
    pkgs.aria
    pkgs.bat
    pkgs.git
    pkgs.neovim
    pkgs.tmux
    pkgs.yt-dlp
    pkgs.zsh
  ];

  home.stateVersion = "22.05";

  programs.home-manager.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
