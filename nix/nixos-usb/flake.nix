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
          home-manager.users.user = import ../modules/user.nix;

          system.stateVersion = "24.11";
        })
        ../modules/packages.nix
        home-manager.nixosModules.home-manager
      ];
    };
  };
}