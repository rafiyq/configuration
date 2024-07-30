{
  description = "nix build .#nixosConfigurations.nixos.config.system.build.sdImage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ modulesPath, ... }: {
          imports = [ (modulesPath + "/installer/sd-card/sd-image-x86_64.nix") ];
        })

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.user = import [
            ({ config, pkgs, ... }:{
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