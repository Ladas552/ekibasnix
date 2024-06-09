{ config, pkgs, inputs, ... }:

{
  imports = [
    ./fish.nix
      ./git.nix
      ./nixvim.nix
      ./ranger.nix
      ./term.nix
  ];
  home = {
    programs = {
      zathura = {
        enable = true;
      };
      btop = {
        enable = true;
      };
      fd = {
        enable = true;
      };
      fzf = {
        enable = true;
        enableFishIntegration = true;
      };
      fastfetch = {
        enable = true;
      };
      ripgrep = {
        enable = true;
      };
      imv = {
        enable = true;
      };
    };
    services = {
      flameshot = {
        enable = true;
      };
    };
  };
}
