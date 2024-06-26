{
  description = "NixToks NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

# Secrets
agenix.url = "github:ryantm/agenix";
agenix.inputs.nixpkgs.follows = "nixpkgs";
agenix.inputs.darwin.follows = "";
# HM module
#     home-manager.url = "github:nix-community/home-manager";
#     home-manager.inputs.nixpkgs.follows = "nixpkgs";
# Nixvim
#     nixvim.url = "github:nix-community/nixvim";
#     nixvim.inputs.nixpkgs.follows = "nixpkgs";
# ColorScheme
#     stylix.url = "github:danth/stylix";

# Games
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
  };

  outputs = { self, nixpkgs, aagl, agenix } @inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      NixToks = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; inherit inputs; };

        modules = [
          ./hosts/NixToks/configuration.nix
          inputs.aagl.nixosModules.default
          inputs.agenix.nixosModules.default
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
