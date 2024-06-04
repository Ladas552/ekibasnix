{
  description = "NixToks NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs} @inputs:
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
