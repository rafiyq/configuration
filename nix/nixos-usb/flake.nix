{
  description = "nix build .#nixosConfigurations.nixos.config.system.build.sdImage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ...} @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ({ inputs, pkgs, modulesPath, home-manager, ... }: {
          imports = [ 
            (modulesPath + "/installer/sd-card/sd-image-x86_64.nix")
            ../modules/packages.nix
          ];

          environment.systemPackages = with pkgs; [
            bat
            brave
            ffmpeg
            yt-dlp
          ];

          programs.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          };

          users.users.user = {
            name = "User";
            isNormalUser = true;
            shell = pkgs.fish;
          };

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user = {
            home.stateVersion = "24.11";
            imports = [
              ../modules/user.nix 
              ../modules/hyprland.nix 
            ];
          };

          system.stateVersion = "24.11";
        })
        home-manager.nixosModules.home-manager
      ];
    };
  };
}