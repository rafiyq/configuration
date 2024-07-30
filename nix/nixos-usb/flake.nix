{
  description = "nix build .#nixosConfigurations.nixos.config.system.build.sdImage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };

  outputs = { self, nixpkgs, home-manager ...} @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ({ inputs, pkgs, modulesPath, ... }: {
          imports = [ (modulesPath + "/installer/sd-card/sd-image-x86_64.nix") ];
          programs.hyprland = {
            enable = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          };
        })
        ../modules/packages.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user = import [
            ({ config, pkgs, ... }: {
              home.username = "user";
              home.homeDirectory = "/home/user";
              home.stateVersion = "24.05";
            })
            ../modules/user.nix
          ];
        }
      ];
    };
  };
}