{
  description = "NixToks NixOS config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

# HM module
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

# Games
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs"; # Name of nixpkgs input you want to use
  };

  outputs = { self, nixpkgs, aagl, home-manager} @inputs: let
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      NixToks = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; inherit inputs; };

        modules = [
          ./hosts/NixToks/configuration.nix
          inputs.aagl.nixosModules.default
        ];
      };

       NixFlash = nixpkgs.lib.nixosSystem {
         specialArgs = { inherit system; inherit inputs; };
      
         modules = [
           ./hosts/NixFlash/configuration.nix
             inputs.home-manager.nixosModules.home-manager
             {
               home-manager.useGlobalPkgs = true;
               home-manager.useUserPackages = true;
              home-manager.users.fixnix = import ./hosts/NixFlash/home.nix;
            }
         ];
       };
    };
  };
}
