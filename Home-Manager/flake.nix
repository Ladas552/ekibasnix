{
  description = "Home Manager configuration of ladas552";

  inputs = {
# Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
# ColorScheme
    stylix.url = "github:danth/stylix";
# Neovim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
  };

  outputs = { nixpkgs, home-manager, self, ... }@inputs:
    let
    system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations."ladas552" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = { inherit inputs; };
# Specify your home configuration modules here, for example,
# the path to your home.nix.
      modules = [ 
        ./home.nix
# HM modules
        inputs.nixvim.homeManagerModules.nixvim
        inputs.stylix.homeManagerModules.stylix
      ];
# Optionally use extraSpecialArgs
# to pass through arguments to home.nix
    };
  };
}
