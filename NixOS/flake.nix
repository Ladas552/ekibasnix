{
  description = "NixToks NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

# Games
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
  };

  outputs = { self, nixpkgs, aagl} @inputs:
    let
    system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config = { allowUnfree = true; };
  };

  in {
    nixosConfigurations = {
      NixToks = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; inherit inputs; };

        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
