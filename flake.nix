{
  description = "Home Manager configuration of ladas552";

  inputs = {
# Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
# ColorScheme
    nix-colors.url = "github:misterio77/nix-colors";
# Neovim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    neorg-overlay.url = "github:nvim-neorg/nixpkgs-neorg-overlay";
# Catuppuccin
catppuccin.url = "github:catppuccin/nix";
#yazi.url = "github:sxyazi/yazi"; # Yazi TUI file manager
#yazi.inputs.nixpkgs.follows = "nixpkgs";

#prismlauncher.url = "github:PrismLauncher/PrismLauncher";
# Genshin
#aagl = {
#	    url = "github:ezKEa/aagl-gtk-on-nix";
#	    inputs.nixpkgs.follows = "nixpkgs";
#    };
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
      ];

# Optionally use extraSpecialArgs
# to pass through arguments to home.nix
    };
  };
}
