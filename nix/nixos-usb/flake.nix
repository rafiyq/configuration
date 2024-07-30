{
  description = "nix build .#nixosConfigurations.nixos.config.system.build.sdImage";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  outputs = { self, nixpkgs }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ({ pkgs, modulesPath, ... }: {
          imports = [ (modulesPath + "/installer/sd-card/sd-image-x86_64.nix") ];
        })
      ];
    };
  };
}