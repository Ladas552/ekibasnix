{ config, pkgs, inputs, ... }:
{
  imports = [
      ./nvim/option.nix
      ./nvim/keymaps.nix
      ./nvim/plugins.nix
      ./nvim/colorscheme.nix
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}

