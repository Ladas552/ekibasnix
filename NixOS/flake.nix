{
  description = "NixToks NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/release-24.05";

    # Secrets
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    # Games
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";    
  };

  outputs = { self, nixpkgs, nixpkgs-stable, aagl, sops-nix, nix-minecraft} @inputs: let
    system = "x86_64-linux";
    # why ppkgs-stable works? here https://discourse.nixos.org/t/allow-unfree-in-flakes/29904/2
    pkgs-stable = import nixpkgs-stable { system = "x86_64-linux"; config.allowUnfree = true; };
  in {
    nixosConfigurations = {
      NixToks = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system inputs pkgs-stable; };

        modules = [
          ./hosts/NixToks/configuration.nix
          inputs.aagl.nixosModules.default
          inputs.sops-nix.nixosModules.sops
          inputs.nix-minecraft.nixosModules.minecraft-servers
        ];
      };

      NixFlash = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; inherit inputs; };

        modules = [
          ./hosts/NixFlash/configuration.nix
          #           inputs.nixvim.nixosModules.nixvim
          #           inputs.stylix.nixosModules.stylix
          #           inputs.home-manager.nixosModules.home-manager
          # {
          #   home-manager.useGlobalPkgs = true;
          #   home-manager.useUserPackages = true;
          #   home-manager.users.fixnix = import ./hosts/NixFlash/apps.nix;
          # }
        ];
      };
    };
  };
}
